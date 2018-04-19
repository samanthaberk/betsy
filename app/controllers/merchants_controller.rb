class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    merchant = Merchant.new(merchant_params)

    if merchant.save
      flash[:success] = "Welcome to Sweatsy. Get ready to get sweaty!"
      redirect_to merchant_path(merchant)
    else
      flash[:error] = "Something went wrong!"
      render :new
    end

  end

  def show
    @merchant = Merchant.find_by(id: params[:id])
  end

  private

  def merchant_params
    params.require(:merchant).permit(:username, :email)
  end

end
