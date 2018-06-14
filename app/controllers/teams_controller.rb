class TeamsController < ApplicationController

    before_action :require_login, only: [:show]

    def new
        @team = Team.new
    end

    def create
        @team = Team.create(team_params)
    end

    private

    def team_params
        params.require(:team).permit(:name, :password, :password_confirmation, :users[:name, :password, :password_confirmation])
    end
end
