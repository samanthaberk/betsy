class Merchant < ApplicationRecord
  has_many :products
  has_many :orders
  # has_many :reviews
  has_many :product_categories, through: :products, source: :categories

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def find_average_rating(merchant)
    total_rating = 0
    merchant.reviews.inject do | review, rating |
      review.rating
    end
    [1,2,3,4].inject(0) {|res, x| x * 2 + res}

  end

end
