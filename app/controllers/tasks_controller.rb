include ProjectsHelper

class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
        t.completion_status = nil
        t.save
        redirect_to project_path(t.project)
    end

    def update
        t = Task.find(params[:id])
        if t.user == current_user
            t.update(completion_status: 'complete', completion_date: DateTime.now)
            t.project.update(last_completed: DateTime.now)
        end
        redirect_to :back
    end

    def last_completed
        @task = Task.last_completed
    end
    

    private

    def task_params
        params.require(:task).permit(:user_id, :chore_id)
    end
end
