class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Products.all
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit

  end

  def show

  end

  def destroy
  end

  private

  def find_product
    @product = products.find_by(id: params[:id])

    head :not_found unless @product
  end

  def product_params
    return params.require(:product).permit(:name, :price, :available)
  end
end
