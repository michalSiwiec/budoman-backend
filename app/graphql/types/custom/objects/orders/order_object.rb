# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Orders
        class OrderObject < Types::BaseObject
          field :id, ID, null: false
          field :name, String, null: false
          field :surname, String, null: false
          field :phone_number, String, null: false
          field :street, String, null: false
          field :city, String, null: false
          field :postal_code, String, null: false
          field :delivery_method, Types::Custom::Enums::DeliveryMethodEnum, null: false
          field :payment_method, Types::Custom::Enums::PaymentMethodEnum, null: false
          field :total_price, Float, null: false

          def total_price
            object.total_price
          end
        end
      end
    end
  end
end
