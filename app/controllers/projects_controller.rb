class ProjectsController < ApplicationController

    def new
        @project = Project.new
    end

    def create
        @project = Team.find(params[:id]).projects.build(project_params)
        if @project.save
            redirect_to team_path(current_team)
        else
            render template: 'projects/new'
        end
    end

    def show
        @project = Project.find(params[:id])
        @task = @project.tasks.build
    end

    def edit
        @project = project_url.find(params[:id]) #project_url or issue with .find? 
    end

    private

    def project_params
        params.require(:project).permit(:name, :team_id)
    end
end
