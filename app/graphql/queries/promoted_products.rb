# frozen_string_literal: true

module Queries
  class PromotedProducts < BaseQuery
    type [Types::Custom::Product], null: false

    def resolve
      Product.promoted
    end
  end
end
