class CartsController < ApplicationController
 before_action :find_order_products
 skip_before_action :require_login

  def show; end

  def edit; end

  def confirmation; end

  def update
    @current_order.assign_attributes(cart_params)

    if @current_order.save
      @current_order.checkout
      previous_order = @current_order

      redirect_to confirmation_path(previous_order.id)
    else
      render :edit, status: :bad_request
    end
  end

  private
  def find_order_products
    @order_products = @current_order.order_products
    head :not_found unless @order_products
  end

  def cart_params
    params.require(:order).permit(:name, :email, :address, :cc_num, :expiry_date, :cc_cvv, :zip)
  end

end
