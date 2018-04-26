class OrdersController < ApplicationController
  skip_before_action :require_login
  before_action :find_order, only: [:show]

  def show; end

  def new
    @order = Order.new()
  end

  def create
    @order = Order.new(order_params)
    @order.status = 'pending'
    if @order.save
      redirect_to order_path(@order.id)
    else
      render :new, status: :bad_request
    end
  end

  private

  # does this need to be edited since we have a cart params??
  def order_params
    params.require(:order).permit(:status, :name, :email, :address, :cc_num, :expiry_date, :cc_cvv, :zip)
  end

  def find_order
    @order = Order.find_by_id(params[:id])
    head :not_found unless @order
  end

end
