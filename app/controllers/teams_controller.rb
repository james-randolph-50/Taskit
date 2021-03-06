class TeamsController < ApplicationController

    before_action :authenticate_user!, only: [:show, :users_index]

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            user = @team.users.build
            user.update(user_params)
            sign_in(user)
            redirect_to team_path(@team)
        else
            render :new
        end
    end

    def show
       @user = current_user
       @team = Team.find(params[:id])
    end

    def users_index
        @team = Team.find(params[:id])
        @users = @team.users
        render template: 'users/index'
    end

    private

    def team_params
        params.require(:team).permit(:name, :password, :password_confirmation)
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
