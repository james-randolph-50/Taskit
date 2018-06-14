class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         belongs_to :team
         has_many :tasks
         has_many :projects, through: :tasks

         def pending_tasks
          self.tasks.select {|task| task.completion_status == 'pending'}
         end
end
