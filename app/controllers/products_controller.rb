class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if product.save
      flash[:success] = "Product added successfully"
      redirect_to products_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new, :status :bad_request
  end

  def edit; end

  def show; end

  def update
    @product.assign_attributes(product_params)

    if @product.save
      redirect_to product_path
    else render :edit, status: :bad_request
  end

  def destroy
    @product.destroy

    redirect_to products_path
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
