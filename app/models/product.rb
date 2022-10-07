class Product < ApplicationRecord
  belongs_to :product_cathegory

  scope :promoted, -> { where('promoted_from <= ? AND promoted_to > ?', Time.now, Time.now) }
  scope :from_type, ->(type) { joins(:product_cathegory).where(product_cathegories: { name: type }) }
end
