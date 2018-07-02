class SessionController < ApplicationController
    layout "session"
    before_action :require_user, only: [:dashboard]

    def index 
        @user=User.new
    end

    def login
        islogged=false
        if !params[:user][:email].blank? and !params[:user][:password].blank? 
            user = User.find_by(email: params[:user][:email])    
            if user and user.authenticate(params[:user][:password])
                session[:user_id]=user.id
                islogged=true
            end    
        end    
        if islogged
            redirect_to dashboard_session_index_path
        else 
            flash[:danger] = 'Invalid email/password combination' 
            @user=User.new
            render 'index'    
        end
    end    

    def dashboard
    end

    def new
        @user=User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to dashboard_session_index_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:user_id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to dashboard_session_index_path
        
    end
    
    private
    def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
end
end
