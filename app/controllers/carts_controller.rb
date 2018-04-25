class CartsController < ApplicationController
  before_action :find_order_products

  def show; end

  def edit; end

  def update; end

  private
  def find_order_products
    @order_products = @current_order.order_products
    head :not_found unless @order_products
  end

end
