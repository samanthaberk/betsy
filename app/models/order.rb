class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
  has_many :merchants, through: :products

  validates :name, presence: true

  validates :email, presence: true, format: {with: /@/, message: "Must include @"}

  validates :address, presence: true, format: { with: /\A[\d]+/,
      message: "Must start with digits" }

  validates :cc_num, presence: true, format: { with: /\A[\d]{16}\z/,
      message: "Digits only" }

  validates :expiry_date, presence: true, format: { with: /\A[\d]{4}\z/,
      message: "Digits only" }

  validates :cc_cvv, presence: true, format: { with: /\A[\d]{3}\z/,
      message: "Digits only" }

  validates :zip, presence: true, format: { with: /\A[\d]+\z/,
      message: "Digits only" }
end
