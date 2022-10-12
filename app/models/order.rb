class Order < ApplicationRecord
  belongs_to :user
  has_many :products_orders
end
