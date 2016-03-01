class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  private

  def line_item_params
    params.require(:line_item).permit(:name, :order_id, :product_id)
  end
end
