include ProjectsHelper

class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
        t.save
        redirect_to project_path(t.project)
    end

    def update
        t = Task.find(params[:id])
        if t.user == current_user
            t.update(completion_status: 'complete', completion_date: DateTime.now, completed: true)
            t.project.update(last_completed: DateTime.now)
        end
        redirect_to :back
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


    private

    def task_params
        params.require(:task).permit(:user_id, :project_id, :notes)
    end
end
