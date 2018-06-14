include ProjectsHelper

class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
        t.completion_status = nil
        t.save
        redirect_to project_path(t.project)
    end

    def complete
        t = Task.find(params[:id])
        if t.user == current_user
            t.update(completion_status: 'complete', completion_date: DateTime.now)
        end
        redirect_to :back
    end

    private

    def task_params
        params.require(:task).permit(:user_id, :chore_id)
    end
end
