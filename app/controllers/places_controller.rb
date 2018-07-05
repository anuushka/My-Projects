class PlacesController < ApplicationController
  def index
     @places =  Place.limit(4).order("count DESC")
     @categories = Category.all
  end

  def show
   @categories = Category.all
   
    @place = Place.find(params[:id])
    @average = @place.comments.average(:rating)
    @count = @place.count
    @place.update_columns(count: @count+1)
    puts @count   
  end
  def edit
  @Place = Place.find(params[:id])
  end
  def submit
    @status = @place.status
    @place.update_columns(status: @status = 1)
  end

  def edit
    @Place = Place.find(params[:id])
  end

  def submit
    @status = @place.status
    @place.update_columns(status: @status = 1)
  end
	def new
    @places = Place.new
    @categories = Category.all
  end

  def check
    @categories = Category.all
    @check = Place.search(params[:search]).paginate(:page => params[:page], per_page:4)
  end
  
  def create
    @user = User.find(session[:user_id])
    @place = @user.places.create(place_params)
    @category = Category.find(params[:category])
    @place.categories << @category
    @place.save
    redirect_to @place
  end

  def check
    @categories = Category.all
    @check = Place.search(params[:search]).paginate(:page => params[:page], per_page:6)
  end
 
  private
  def place_params
    params.require(:place).permit(:title, :image, :description, :timetable, :opentime, :closetime, :price, :location, :longitude, :latitude, :phone, :category)
  end
end
