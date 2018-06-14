class UsersController < ApplicationController
    before_action :verify_team

    def show
        @user = USer.find(param[:id])
    end
end
