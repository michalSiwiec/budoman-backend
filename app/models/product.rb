class Product < ApplicationRecord
  belongs_to :product_category
  has_many :products_orders

  validates :name, presence: true
  validates :price, numericality: true
  validates :available_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :picture_key, presence: true, length: { minimum: 20, max: 120 }
  validates :picture_bucket, presence: true, length: { minimum: 10, max: 120 }

  scope :promoted, -> { where('promoted_from <= ? AND promoted_to > ?', Time.now, Time.now) }
  scope :from_type, ->(type) { joins(:product_category).where(product_categories: { name: type }) }
end
