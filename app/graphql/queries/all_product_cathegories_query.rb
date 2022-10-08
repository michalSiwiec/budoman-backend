# frozen_string_literal: true

module Queries
  class AllProductCathegoriesQuery < BaseQuery
    type [Types::Custom::Objects::ProductCathegoryObject], null: false

    def resolve
      ProductCathegory.all
    end
  end
end
