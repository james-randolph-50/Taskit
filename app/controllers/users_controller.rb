class UsersController < ApplicationController
    before_action :verify_team

    def show
        @user = User.find(params[:id])
        @task = Task.new
    end

    def show_complete
        @user = User.find(params[:user_id])
        @team = Team.find(params[:user_id])
    end
end
