class Review < ApplicationRecord
  validates :rating, presence: true
  validates :description, presence: true
  belongs_to :product

end
