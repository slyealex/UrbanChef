class ClientsController < ApplicationController
  before_action :load_order

  def index
    @clients = Client.all
    @chef = current_chef
  end


  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
    @serving_chefs = Chef.select{ |x| x.service_radius.to_f > x.distance_to(current_client, :km) }

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

  def load_order
    # @order = current_chef.orders
  end

end
