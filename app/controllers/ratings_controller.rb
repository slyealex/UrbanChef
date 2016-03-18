class RatingsController < ApplicationController

  before_action :load_chef



  def index
    @rating = Rating.all
  end


  def show
    @rating = Rating.find(params[:id])
  end

  def create

    @rating = @chef.ratings.build(rating_params)
    @rating.client = current_client




    if @rating.save

      respond_to do |format|
        format.html do
          if request.xhr?
            render @rating
          else
            redirect_to @chef
          end
        end

          format.js
          end
      else
        render 'chefs/show'
      end

    end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
  end

  private
  def rating_params
    params.require(:rating).permit(:review, :chef_id, :rating)
  end

  def load_chef
    @chef = Chef.find(params[:chef_id])
  end








end
