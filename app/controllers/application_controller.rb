class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

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
