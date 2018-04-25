class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  before_action :current_order
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
      @current_order = Order.find(session[:order_id])
    else
      @current_order = Order.create(status: 'pending')
      session[:order_id] = @current_order.id
    end
  end

end
