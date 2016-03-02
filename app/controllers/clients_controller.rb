class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end


  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
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
