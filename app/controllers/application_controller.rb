class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_team

  def current_team
    current_user.team
  end

  def verify_team
    User.find(params[:id]) == Team.find(params[:id])
  end

 # def require_login
  #  redirect_to root_path unless session[:user_id]
  #end

  #def current_user
   # @current_user ||= User.find(session[:user_id])
  #end

  #def logged_in?
   # current_user != nil
  #end


end
