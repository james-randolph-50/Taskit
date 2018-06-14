include ProjectsHelper

class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
        t.save
        redirect_to project_path(t.project)
    end

    def task_params
        params.require(:task).permit(:user_id, :chore_id)
    end
end
