# frozen_string_literal: true

class Order < ApplicationRecord
  DELIVERIES_DETAILS = [
    { method: 'in_post', price: 10.99 },
    { method: 'dpd', price: 15.99 },
    { method: 'pick_up_at_the_point', price: 0.0 }
  ].freeze

  ALLOWED_PAYMENT_METHOD = %w[cash_payment traditional_transfer].freeze
  PHONE_NUMBER_REGEX = /\A[0-9]{9}\z/.freeze

  belongs_to :user
  has_many :products_orders

  validates :delivery_method, inclusion: { in: DELIVERIES_DETAILS.pluck(:method) }
  validates :payment_method, inclusion: { in: ALLOWED_PAYMENT_METHOD }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }

  def total_price
    [price_for_products, price_for_delivery].flatten.sum
  end

  private

  def price_for_products
    products_orders.map { |product_order| product_order.product_quantity * product_order.product.price }
  end

  def price_for_delivery
    DELIVERIES_DETAILS.find { |delivery_details| delivery_details[:method] == delivery_method }[:price]
  end
end
