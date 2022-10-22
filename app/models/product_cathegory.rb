# frozen_string_literal: true

class ProductCathegory < ApplicationRecord
  has_many :products

  validates :name, presence: true
end
