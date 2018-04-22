class Merchant < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :reviews, through: :products, source: :order_products
  has_many :product_categories, through: :products, source: :categories

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
