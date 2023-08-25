class Product < ApplicationRecord
  belongs_to :product_category
  has_many :products_orders

  validates :name, presence: true
  validates :picture_path, presence: true
  validates :price, numericality: true
  validates :available_quantity, numericality: { only_integer: true }

  scope :promoted, -> { where('promoted_from <= ? AND promoted_to > ?', Time.now, Time.now) }
  scope :from_type, ->(type) { joins(:product_category).where(product_categories: { name: type }) }
end
