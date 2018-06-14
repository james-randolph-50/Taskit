class TasksController < ApplicationController

    def create
        t = Task.new(task_params)
    end

    def task_params
        params.require(:task).permit(:user_id, :chore_id)
    end
end
