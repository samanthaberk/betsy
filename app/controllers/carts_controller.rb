class CartsController < ApplicationController

  def show
    @order_products = current_order.order_products
  end

  def edit; end

  def update; end

end
