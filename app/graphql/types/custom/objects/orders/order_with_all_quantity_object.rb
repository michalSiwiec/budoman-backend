# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Orders
        class OrderWithAllQuantityObject < Types::BaseObject
          field :orders, [Types::Custom::Objects::Orders::OrderObject], null: false
          field :all_orders_quantity, Integer, null: false
        end
      end
    end
  end
end
