class Order < ApplicationRecord
  belongs_to :merchant
  has_many :products

  validates :name, presence: true

  validates :email, presence: true, format: {with: /@/, message: "Must include @"}

  validates :address, presence: true, format: { with: /\A[\d]+/,
      message: "Must start with digits" }

  validates :cc_num, presence: true, format: { with: /\A[\d]+\z/,
      message: "Digits only" }

  validates :expiry_date, presence: true

  validates :cc_cvv, presence: true, format: { with: /\A[\d]+\z/,
      message: "Digits only" }

  validates :zip, presence: true, format: { with: /\A[\d]+\z/,
      message: "Digits only" }
end
