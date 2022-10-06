# frozen_string_literal: true

module Queries
  class PromotedProducts < BaseQuery
    argument :promoted, Boolean
    type [Types::Custom::Product], null: false

    def resolve(params)
      Product.all
    end
  end
end
