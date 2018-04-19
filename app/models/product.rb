class Product < ApplicationRecord
  # relationship belongs to a user
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0}
end
