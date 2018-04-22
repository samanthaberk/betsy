class Review < ApplicationRecord

  belongs_to :product
  # validates :rating, presence: true, numericality: true, length: { in: 1..5 }
  # validates :description, presence: true

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
