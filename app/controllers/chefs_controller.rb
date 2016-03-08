class ChefsController < ApplicationController



  def index
    if params[:search]
      @chefs = Chef.near(params[:search], 0.7, units: :km)
    elsif params[:longitude] && params[:latitude]
      @chefs = Chef.near([params[:latitude], params[:longitude]], 0.7, units: :km)
    else
      @chefs = Chef.all
    end

    respond_to do |format|
      format.html
      format.js
    end

  end



  def new
    @chef = Chef.new
    # @project = Project.new
    @product = Product.new
  end

  def show
    @chef = Chef.find(params[:id])
    @order = Order.new
    @nearby_chefs = @chef.nearbys(1, units: :km)
    @clients_near_chef = Client.near(current_chef, 1.5, units: :km)
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to @chef, notice: "You are now a chef!"
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def updated
    @chef = Chef.find(params[:id])

    if @chef.update_attributes(chef_params)
      redirect_to root_path, notice: 'Update Successfull!'
    else
      render :edit
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation, :experience, :location, :chef_avatar, :chef_avatar_cache, :service_radius, :specialty,
                                products_attributes: [:name, :description, :url, :_destroy, :product_picture, :product_picture_cache, :price])
  end

end
