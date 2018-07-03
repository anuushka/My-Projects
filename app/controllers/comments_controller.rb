class CommentsController < ApplicationController

def index
end

def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params)
    redirect_to place_path(@place)
    puts session[:user_id]
  end
  def destroy
    
    @place = Place.find(params[:place_id])
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to place_path(@place)
  end
  private
    def comment_params
      params.require(:comment).permit(:user, :post,:rating,params[session[:user_id]])
    end
end


