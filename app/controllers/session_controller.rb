class SessionController < ApplicationController
    layout "session"
    skip_before_action :require_user, only: [:index, :login, :new, :create, :social_login]

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
        @categories = Category.all
        @user = User.find(session[:user_id])
        @dashboard = @user.places.where(status:1)
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
        @user = User.find(session[:user_id])
    end

    def update
        @user = User.find(session[:user_id])
        @user.update(user_params)
        redirect_to dashboard_session_index_path
    end

  
    def logout
        session[:user_id] = nil
        flash[:success] = "Хэрэглэгч гарлаа"
        redirect_to login_session_index_path
    end 

    def social_login
        result=Hash.new
        result[:status]="ok"
        if  params[:user].present?
            user = User.find_by(email: params[:user][:email])
            if params[:user][:fb_id].present?
                user =  User.find_by(fb_id: params[:user][:fb_id])
            elsif params[:user][:email].present?
                user =  User.find_by(email: params[:user][:email])
            end
    
            if user.nil?
                user = User.new(social_user_params)
                password = SecureRandom.base64
                user.password=password
                user.password_confirmation=password
                
                user.save
            else
                user.update(social_user_params)
            end   
            session[:user_id] = user.id
            result[:url]=dashboard_session_index_path
        end
        render json: result

    end

  
    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def social_user_params
        params.require(:user).permit(:name,:email,:fb_id, :user_type)
    end

    end

