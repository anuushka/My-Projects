class PlacesController < ApplicationController
  def index
      @places =  Place.limit(4).order("count DESC")

  end


  def show
    @place = Place.find(params[:id])
  end

	def new
    @place=Place.new
  end
  
  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to @place
    puts "testing"
  end

 
private
  def place_params
    params.require(:place).permit(:title, :image, :description, :timetable, :opentime, :closetime, :price, :location, :longitude, :latitude, :phone)
  end
end
