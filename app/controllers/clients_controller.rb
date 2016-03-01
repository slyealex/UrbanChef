class ClientsController < ApplicationController

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
      redirect_to root_path, notice: "You are now a client!"
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :password, :password_confirmation, :location)
  end

end
