class OrdersController < ApplicationController
  # before_action :load_chef

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
      @order = current_client.orders.build(order_params)
      @order.client = current_client
      @order.chef = current_chef

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

    # def load_chef
    #   @chef = Chef.find(params[:chef_id])
    # end

end
