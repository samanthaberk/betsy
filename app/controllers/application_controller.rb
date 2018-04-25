class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  before_action :require_login

  def current_user
    @current_user ||= Merchant.find(session[:merchant_id]) if session[:merchant_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to complete that action."
    end
  end

  def current_order
    if session[:order_id]
      result = Order.find(session[:order_id])
      # if result.status == "paid"
      #   Order.new
      # else
      #   return result
      # end
    else
      Order.new
    end
  end
end
