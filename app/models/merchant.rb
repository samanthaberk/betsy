class Merchant < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :reviewed_products, through: :reviews, source: :product
  has_many :product_categories, through: :categories, source: :product


  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end
