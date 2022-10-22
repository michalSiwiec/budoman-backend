# frozen_string_literal: true

class ProductsOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
