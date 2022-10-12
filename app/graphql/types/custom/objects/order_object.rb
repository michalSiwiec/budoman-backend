# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class OrderObject < Types::BaseObject
        field :name, String, null: false
        field :surname, String, null: false
        field :phone_number, String, null: false
        field :street, String, null: false
        field :city, String, null: false
        field :postal_code, String, null: false
        field :delivery_method, Types::Custom::Enums::DeliveryMethodEnum, null: false
        field :payment_method, Types::Custom::Enums::PaymentMethodEnum, null: false
      end
    end
  end
end
