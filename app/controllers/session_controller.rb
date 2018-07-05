class SessionController < ApplicationController
   layout "session"
    skip_before_action :require_user, only: [:index, :login, :new, :create]

    def index 
        @user=User.new
         @categories = Category.all
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
            redirect_to places_path
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
            redirect_to places_index_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update
        @user = User.find(session[:user_id])
        @user.update(user_params)
        redirect_to places_index_path
        
    end

    def logout
        session[:user_id] = nil
        flash[:success] = "Хэрэглэгч гарлаа"
        redirect_to login_session_index_path
    end 

    
    private
    def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
end
end
