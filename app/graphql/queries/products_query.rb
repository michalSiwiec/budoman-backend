module Queries
  class ProductsQuery < BaseQuery
    argument :input, Types::Custom::Inputs::Filtrations::ProductInput, required: false
    type Types::Custom::Objects::Products::ProductsWithQuantityObject, null: false

    def resolve(params)
      ProductQuery.new(params).call
    end
  end
end
