class Team < ApplicationRecord
    has_many :users
    has_many :projects
    has_secure_password
end
