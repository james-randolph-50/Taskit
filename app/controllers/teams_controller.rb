class TeamsController < ApplicationController

    before_action :authenticate_user!, only: [:show]

    def new
        @team = Team.new
    end

    def create
        @team = Team.create(team_params)
    end

    def show
        @team = current_user.team
    end

    private

    def team_params
        params.require(:team).permit(:name, :password, :password_confirmation, :users[:name, :password, :password_confirmation])
    end
end
