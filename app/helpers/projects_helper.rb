module ProjectsHelper

    def claimed_project?(project)
        project.tasks.any?{|task| task.completion_status.nil?}
    end

    def user_has_task?(project)
        current_user.tasks.any?{|task| task.project_id == project.id}
    end

    def claimed_project_notice
    end
end
