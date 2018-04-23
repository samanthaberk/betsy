class Review < ApplicationRecord
  validates :rating, presence: true
  validates :description, presence: true
  belongs_to :product

  def total
    self.count
  end

  def average
    reviews = Review.all
    review_count = reviews.count

    ratings = reviews.map { |review| review.rating}
    ratings_sum = ratings.inject { |sum, rating| sum + rating }

    return ratings_sum / review_count
  end

end
