class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update]

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:date, :status, :name, :email, :address, :cc_num, :expiry_date, :cc_cvv, :zip)
  end

  def find_order
    @order = Order.find_by_id(params[:id])
  end
end

end
