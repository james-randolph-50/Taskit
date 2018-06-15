module ProjectsHelper


    def user_has_task?(project)
        current_user.tasks.any?{|task| task.project_id == project.id &&  task.completion_status == 'pending'}
    end

    def claimed_project_notice
    end
end
