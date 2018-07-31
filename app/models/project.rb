class Project < ApplicationRecord
    belongs_to :team
    has_many :users, through: :tasks
    has_many :tasks

    validates :name, presence: true

    def claimed_project?
        tasks.any?{|task| task.due_date && task.id}
    end


end
