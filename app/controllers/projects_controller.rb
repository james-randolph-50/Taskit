class ProjectsController < ApplicationController

    def new
        @project = current_team.projects.build
    end
end
