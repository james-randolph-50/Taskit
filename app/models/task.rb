class Task < ApplicationRecord
    enum status: [ :incomplete, :complete ]

    belongs_to :user
    belongs_to :project

    validates :notes, presence: true

    scope :completed, -> { where(completed: true) }

    def self.completed
        Task.completed
    end
end
