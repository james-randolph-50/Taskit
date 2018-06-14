class ProjectsController < ApplicationController

    def new
        @project = current_team.projects.build
    end

    def create
        @project = Project.create(project_params)
        redirect_to team_path(current_team)
    end

    def edit
    end

    private

    def project_params
    end
end
