# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      module Mutations
        class AddOrderInput < Types::BaseInputObject
          argument :name, String, required: true
          argument :surname, String, required: true
          argument :email, String, required: true
          argument :phone_number, String, required: true
          argument :street, String, required: true
          argument :city, String, required: true
          argument :postal_code, String, required: true
          argument :delivery_method, Types::Custom::Enums::DeliveryMethodEnum, required: true
          argument :payment_method, Types::Custom::Enums::PaymentMethodEnum, required: true
          argument :user_id, ID, required: true
          argument :products_order, [Types::Custom::Inputs::Mutations::ProductsOrderInput], required: true
        end
      end
    end
  end
end
