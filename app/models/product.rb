class Product < ApplicationRecord
  has_many :order_products
  has_many :reviews, dependent: :destroy
  has_many :orders, through: :order_products
  has_and_belongs_to_many :categories
  belongs_to :merchant

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0}

  def average_rating
    reviews = self.reviews

    review_count = reviews.count

    ratings = reviews.map { |review| review.rating}
    ratings_sum = ratings.inject { |sum, rating| sum + rating }

    return (ratings_sum.to_f / review_count.to_f).round(2)
  end

end
