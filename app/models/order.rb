class Order < ApplicationRecord
  ALLOWED_DELIVERY_METHOD = %w[in_post dpd pick_up_at_the_point]
  ALLOWED_PAYMENT_METHOD = %w[traditional_transfer cash_on_delivery]
  PHONE_NUMBER_REGEX = /\A[0-9]{9}\z/
  
  belongs_to :user
  has_many :products_orders

  validates :delivery_method, inclusion: { in: ALLOWED_DELIVERY_METHOD }
  validates :payment_method, inclusion: { in: ALLOWED_PAYMENT_METHOD }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
end
