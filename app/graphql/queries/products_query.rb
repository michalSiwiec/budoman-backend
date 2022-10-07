module Queries
  class ProductsQuery < BaseQuery
    argument :promoted, Boolean, required: false
    type [Types::Custom::Product], null: false

    def resolve(params)
      ProductQuery.new(params).call
    end
  end
end

# Kategoria
# Paginacja
# Promowane
# Sortowane
