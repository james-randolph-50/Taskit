module ProjectsHelper

    def claimed_project?
        @project.tasks.any?{|task| task.completion_status.nil?}
    end
end
