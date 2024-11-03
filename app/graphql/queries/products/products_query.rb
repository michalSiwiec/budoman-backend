# frozen_string_literal: true

module Queries
  module Products
    class ProductsQuery < BaseQuery
      argument :input, Types::Custom::Inputs::Filtrations::Products::ProductInput, required: false
      type Types::Custom::Objects::Products::ProductsWithQuantityObject, null: false

      def resolve(params)
        ProductQuery.new(params).call
      end
    end
  end
end
