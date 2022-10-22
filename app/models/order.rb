# frozen_string_literal: true

class Order < ApplicationRecord
  ALLOWED_DELIVERY_METHOD = %w[in_post dpd pick_up_at_the_point].freeze
  ALLOWED_PAYMENT_METHOD = %w[cash_payment traditional_transfer].freeze
  PHONE_NUMBER_REGEX = /\A[0-9]{9}\z/.freeze

  belongs_to :user
  has_many :products_orders

  validates :delivery_method, inclusion: { in: ALLOWED_DELIVERY_METHOD }
  validates :payment_method, inclusion: { in: ALLOWED_PAYMENT_METHOD }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }

  def total_price
    sum = 0
    products_orders.each { |product_order| sum += product_order.product_quantity * product_order.product.price }
    sum
  end
end
