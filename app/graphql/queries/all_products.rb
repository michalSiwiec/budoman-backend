# frozen_string_literal: true

module Queries
  class AllProducts < BaseQuery
    type [Types::Custom::Product], null: false

    def resolve
      Product.all
    end
  end
end
