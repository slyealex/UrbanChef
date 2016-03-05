class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end


  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
    # To make nearby chefs accessable in client_show
    @chef = Chef.find(params[:id])
    # @product = @chef.products.build
    # @nearby_chefs = @chef.nearbys(20, units: :km)
    @chefs_near_client = Chef.near(current_client, 10, units: :km )
    @chefs = Chef.all

  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: "You are now a client!"
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :password, :password_confirmation, :location, :client_avatar, :client_avatar_cache)
  end

end
