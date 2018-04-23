class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def root
    @products = Product.all
    @categories = Category.all
    @merchants = Merchant.all
  end

  def index
    merch_id = params[:merchant_id]
    if merch_id.nil?
      @products = Product.all
      @order_product = current_order.order_products.new
    else
      @products = Merchant.find(merch_id).products
    end
  end

  def new
    @product = Product.new(merchant_id: params[:merchant_id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product added successfully"

      redirect_to merchant_products_path(merchant.id)

    else
      flash.now[:failure] = "Validations Failed"
      render :new, status: :bad_request
    end
  end

# TODO: attempted to move review creation to products controller but kept getting UnKNownMethodError on merchant and products (evaluated to nil)
  # def create_review
  #   @review = Review.new(review_params)
  #   @review.product_id = params[:id]
  #
  #   if @review.save
  #     redirect_to product_path(@product.id)
  #   else
  #     flash[:error] = "You must submit a rating of 1-5 and a description."
  #     @product = Product.find_by(id: params[:product_id])
  #     # id = @product.id
  #     puts "line 43 executed"
  #     render :show, status: :bad_request
  #   end
  # end

  def edit; end

  def show; end

  def update
    @product.assign_attributes(product_params)

    if @product.save
      redirect_to product_path
    else render :edit, status: :bad_request
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])

    head :not_found unless @product
  end

  def product_params
    return params.require(:product).permit(:name, :price, :available, :merchant_id)
  end
  private
  # def review_params
  #   return params.require(:review).permit(:rating, :description)
  # end
end
