class UsersController < ApplicationController
    before_action :verify_team

    def show
        @user = User.find(param[:id])
        @taask = Task.new
    end
end
