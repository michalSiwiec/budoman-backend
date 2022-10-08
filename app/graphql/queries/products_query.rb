module Queries
  class ProductsQuery < BaseQuery
    argument :input, Types::Custom::Inputs::Filtrations::ProductInput, required: false
    type Types::Custom::Objects::Products::ProductWithAllQuantityObject, null: false

    def resolve(params)
      {
        products: ProductQuery.new(params).call,
        all_products_quantity: Product.count
      }
    end
  end
end
