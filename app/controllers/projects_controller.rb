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

   # def tasks
    #    project = Project.find(params[:id])
      #  t = project.tasks
       # render json: t 

       # render '/projects/:id/tasks', :layout => false
    #end

    def show
        @project = Project.find(params[:id])
        @task = @project.tasks.build
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to '/'
    end

    def tasks_index
        @project = Project.find(params[:id])
        @tasks = @project.tasks
        render template: 'tasks/index'
    end

    def busiest
        @project = Project.most
        render template: 'projects/busiest'
    end
    
    private

    def project_params
        params.require(:project).permit(:name, :team_id)
    end
end
