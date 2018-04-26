class MerchantsController < ApplicationController
  before_action :require_login, only: [:show, :new]

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = @current_user
    redirect_to merchant_path(@merchant)
  end

  def create
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      flash[:success] = "Welcome to Sweatsy. Get ready to get sweaty!"
      redirect_to merchant_path(@merchant)
    else
      flash[:error] = "Something went wrong!"
      render :new, status: :bad_request
    end

  end

  def show
    @merchant = @current_user
    redirect_to root_path unless @merchant
  end

  private

  def merchant_params
    params.require(:merchant).permit(:username, :email)
  end

end
