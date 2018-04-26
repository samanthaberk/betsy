class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def subtotal
    subtotal = (self.product.price * self.quantity)
  end
end
