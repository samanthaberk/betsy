class CartsController < ApplicationController
skip_before_action :require_login, only: [:show]

  def show
    @order_products = current_order.order_products
  end

end
