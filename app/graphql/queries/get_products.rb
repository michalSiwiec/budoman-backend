# frozen_string_literal: true

module Queries
  class GetProducts < BaseQuery
    type [Types::Custom::Product::ProductType], null: false

    def resolve
      Product.all
    end
  end
end
