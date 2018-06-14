class TeamsController < ApplicationController

    def new
        @team = Team.new
    end

    def create
        @team = Team.create(team_params)
    end

    private

    
end
