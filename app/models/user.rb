class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

        validates :name, presence: true

         belongs_to :team
         has_many :tasks
         has_many :projects, through: :tasks

         def completed_tasks
          self.tasks.select {|task| task.status == 'complete'}
         end
         

         def pending_tasks
          self.tasks.select {|task| task.status == 'incomplete'}
         end
end
