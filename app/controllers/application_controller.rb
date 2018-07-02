class ApplicationController < ActionController::Base
  def require_user  
    redirect_to login_session_index_path unless session[:user_id] 
end

  protect_from_forgery with: :exception
end
