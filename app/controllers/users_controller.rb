class UsersController < ApplicationController
    before_action :verify_team

    def show
        @user = User.find(param[:id])
        @task = Task.new
    end
end
