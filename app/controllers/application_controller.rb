class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to root_path unless session[:user_id]
  end
  
end
