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

  def products_in_order
    all_products = []
    @order.products.each do |p|
      all_products << p
    end
    return all_products
  end

  def quantity_in_order(product)
    @order.order_products.find_by(product_id: product.id).quantity
  end

  # can i use a price function in product?
  def product_subtotal(product)
    quant = quantity_in_order(product)
    price = product.price
    return quant * price
  end

  def order_total
  end

end
