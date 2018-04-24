class OrderProductsController < ApplicationController

  def create
    @order = current_order
    @item = OrderProduct.new(item_params)
    @item.order = @order
    if @order.save && @item.save
      session[:order_id] = @order.id
      redirect_to products_path
    else
      @order.errors.messages.inspect
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_products.find(params[:id])
    @item.destroy
    if @order.save
      flash[:success] = "#{Product.find_by(id: @item.product_id).name} has been deleted from your cart."
    else
      flash[:failure] = "Something went wrong, but don't sweat it! Here's your cart."
    end
    redirect_to cart_path
  end

  private
  def item_params
    params.require(:order_product).permit(:quantity, :product_id)
  end

end
