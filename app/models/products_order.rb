class ProductsOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product_quantity, numericality: { only_integer: true }
end
