module OrdersHelper

  def last_four
    @order.cc_num.last(4)
  end

  def format_expiry
    @order.expiry_date.first(2) + "/" + @order.expiry_date.last(2)
  end

  def date_placed
    @order.updated_at.strftime("%B %d, %Y") + " at " + @order.updated_at.strftime("%I: %M %p")
  end

end
