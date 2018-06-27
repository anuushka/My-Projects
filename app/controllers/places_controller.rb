class PlacesController < ApplicationController
  def index
      @places =  Place.limit(4).order("count DESC")
  end

  def show
    @place = Place.find(params[:id])
    @average = Comment.where(place_id: params[:id]).average(:rating)
    puts @average
    puts  params[:place_id]
  end

	def new
    @places = Place.new
    @categories = Category.all
  end
  
  def create
    @place = Place.new(place_params)
    @category = Category.find(params[:category])
    @place.categories << @category
    @place.save
    redirect_to @place
  end
 
  private
  def place_params
    params.require(:place).permit(:title, :image, :description, :timetable, :opentime, :closetime, :price, :location, :longitude, :latitude, :phone, :category)
  end
end
