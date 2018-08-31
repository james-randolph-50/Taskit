include ProjectsHelper

class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
        t.save
        redirect_to project_path(t.project)
    end

    def index
        p = Project.find(params[:project_id])
        p.tasks
        # line 13: render JSON, not a template. 
        # how respond from nested and non-nested routes
        
    end

    def update
        t = Task.find(params[:id])
        if t.user == current_user
            t.update(completion_status: 'complete', completion_date: DateTime.now, completed: true)
            t.project.update(last_completed: DateTime.now)
        end
        redirect_to :back
    end

    def show
        @user = current_user
        @task = Task.find(params[:id])
    end

    def toggle_status
        @task = Task.find(params[:id])
       
        if @task.incomplete?
            @task.complete!
        elsif @task.complete?
            @task.incomplete!
        end
       
        redirect_to @task.project
      end

      def delete
        @task = Task.find(params[:id])
      end

      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to project_path
      end


    private

    def task_params
        params.require(:task).permit(:user_id, :project_id, :notes)
    end
end
