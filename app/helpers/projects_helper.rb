module ProjectsHelper

    def claimed_project?(project)
        project.tasks.any?{|task| task.completion_status.nil?}
    end

    def claimed_project_notice
    end
end
