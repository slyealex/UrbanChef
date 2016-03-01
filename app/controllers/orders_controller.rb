class OrdersController < ApplicationController
  def new
    def new
      @order = Order.new
    end

    def show
      @order = Order.find(params[:id])
    end

    def edit
      @order = Order.find(params[:id])
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        redirect_to root_path, notice: "Order created!"
      else
        render :new
      end
    end

    private

    def order_params
      params.require(:order).permit(:client_id, :chef_id)
    end
end
