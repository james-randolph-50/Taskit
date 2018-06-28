class UsersController < ApplicationController
    before_action :authenticate_user!, :verify_team

    def show
        @user = User.find(params[:id])
        @task = Task.new
    end

    def show_complete
        @user = User.find(params[:id])
        @team = Team.find(params[:team_id])
    end
end
