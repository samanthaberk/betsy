class OrderProductsController < ApplicationController
  before_action :find_order_product, only: [:show, :update, :edit, :destroy]

  def create
    @order = current_order
    @item = OrderProduct.new(item_params)
    @item.order = @order
    if @order.save && @item.save
      name = Product.find_by(id: @item.product_id).name.titleize
      quant = @item.quantity
      session[:order_id] = @order.id
      flash[:success] = "You added #{quant} #{quant > 1 ? name.pluralize : name}!"
      redirect_to products_path
    else
      @order.errors.messages.inspect
    end
  end

  def edit; end

  def update; end

  def destroy
    @item.destroy
    if @order.save
      flash[:success] = "#{Product.find_by(id: @item.product_id).name.titleize} has been deleted from your cart."
    else
      flash[:failure] = "Something went wrong, but don't sweat it! Here's your cart."
    end
    redirect_to cart_path
  end

  private
  def item_params
    params.require(:order_product).permit(:quantity, :product_id)
  end

  def find_order_product
    @order = current_order
    @item = @order.order_products.find(params[:id])
  end

end
