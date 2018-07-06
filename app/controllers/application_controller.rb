class ApplicationController < ActionController::Base
  before_action :require_user
 
  #Authenticate
      def require_user  
          redirect_to login_session_index_path unless session[:user_id] 
      end


end