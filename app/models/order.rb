class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :merchants, through: :products
  before_save :update_status
  before_save :order_total

  # validates :name, presence: true
  #
  # validates :email, presence: true, format: {with: /@/, message: "Must include @"}
  #
  # validates :address, presence: true, format: { with: /\A[\d]+/,
  #   message: "Must start with digits" }
  #
  # validates :cc_num, presence: true, format: { with: /\A[\d]{16}\z/,
  #   message: "Digits only" }
  #
  # validates :expiry_date, presence: true, format: { with: /\A[\d]{4}\z/,
  #   message: "Digits only" }
  #
  # validates :cc_cvv, presence: true, format: { with: /\A[\d]{3}\z/,
  #   message: "Digits only" }
  #
  # validates :zip, presence: true, format: { with: /\A[\d]+\z/,
  #     message: "Digits only" }

  def quantity_in_order(product)
    self.order_products.find_by(product_id: product.id).quantity
  end

  # can i use a price function in product?
  def product_subtotal(product)
    quant = quantity_in_order(product)
    price = product.price
    return quant * price
  end

  def order_total
    total = 0
    self.order_products.each do |order_product|
      product = order_product.product
      total += product_subtotal(product)
    end
    return total
  end

  # reduce the total num of products available when user pays for an order
  def decrement(order)
    order.order_products.each do |order_product|
      order_product.product.available -= order_product.quantity
    end
  end

  def update_status
    if self.status == nil?
      self.status = "pending"
    end
  end

  def checkout
    if self.status == "pending"
      self.status = "paid"
    end
  end

  def new_cart
  end

end
