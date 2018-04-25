class MerchantsController < ApplicationController

  before_action :require_login, only: [:show]

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
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
    @merchant = Merchant.find_by(id: params[:id])
    render file: "#{Rails.root}/public/404.html", status: :not_found unless @merchant
  end

  private

  def merchant_params
    params.require(:merchant).permit(:username, :email)
  end

end
