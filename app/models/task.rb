class Task < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :notes, presence: true

    def self.last_completed
        where(completed: true)
    end
end
