class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :url, :chef_id, :product_picture, :product_picture_cache)
  end
end
