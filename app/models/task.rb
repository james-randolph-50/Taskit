class Task < ApplicationRecord
    enum status: [ :incomplete, :complete ]

    belongs_to :user
    belongs_to :project

    validates :notes, presence: true

    scope :completed, -> { where(completed: :1) } 

end
