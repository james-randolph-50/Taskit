class Project < ApplicationRecord
    belongs_to :team
    has_many :tasks

    validates :name, presence: true

    def claimed_project?(project)
        project.tasks.any?{|task| task.completion_status == 'pending' && task.id}
    end
end
