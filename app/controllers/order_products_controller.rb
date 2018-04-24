class OrderProductsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_products.new(item_params)
    if @order.save
      session[:order_id] = @order.id
      redirect_to products_path
    else
      @order.errors.messages.inspect
    end
  end

  private
  def item_params
    params.require(:order_product).permit(:quantity, :product_id)
  end

end