class Product < ApplicationRecord
  has_and_belongs_to_many :orders
  belongs_to :merchant

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0}
end
