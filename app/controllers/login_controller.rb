class LoginController < ApplicationController
	 def index 
       @admin=Admin.new
       @categories = Category.all
    end

    def login
        islogged=false
        if !params[:admin][:email].blank? and !params[:admin][:password].blank? 
            admin = Admin.find_by(email: params[:admin][:email])    
            if admin and admin.authenticate(params[:admin][:password])
                session[:admin_id]=admin.id
                islogged=true
            end    
        end    
        if islogged
            redirect_to dashboard_login_index_path
        else 
            flash[:danger] = 'Invalid email/password combination' 
            @admin=Admin.new
            render 'index'    
        end
    end    

    def dashboard
        @pending = Place.where(status: 0).paginate(:page => params[:page], per_page:8)
           @categories = Category.all
    end
    def denied
        @denied = Place.where(status: 2).paginate(:page => params[:page], per_page:8)
           @categories = Category.all
    end

    def accept
         @categories = Category.all
        @accept = Place.where(status: 1).paginate(:page => params[:page], per_page:8)
    end
    
    def approve
          @place = Place.find(params[:place]) 
          puts "-------------------------------"
          puts params[:place]
          puts "-------------------------------"
          @place.update_columns(status: 1)
          redirect_to  acceptboard_login_index_path
    end
    def decline 
          @place = Place.find(params[:place]) 
          puts "-------------------------------"
          puts params[:place]
          puts "-------------------------------"
          @place.update_columns(status: 2)
          redirect_to deniedboard_login_index_path   
    end
    def new
        @admin=Admin.new
    end
    def show
        
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_id] = @admin.id
            redirect_to dashboard_login_index_path
        else
            render 'new'
        end
    end
    
    private
    def admin_params
    params.require(:admin).permit(:surName, :name, :PD, :email, :phone, :password,:password_confirmation)
	end
end
