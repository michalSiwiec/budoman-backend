# frozen_string_literal: true

module Queries
  module Orders
    class OrdersQuery < BaseQuery
      argument :input, Types::Custom::Inputs::Filtrations::OrdersFiltrationInput, required: false
      type Types::Custom::Objects::Orders::OrderWithAllQuantityObject, null: false
  
      def resolve(params)
        {
          orders: OrderQuery.new(params).call,
          all_orders_quantity: Order.count
        }
      end
    end
  end
end
