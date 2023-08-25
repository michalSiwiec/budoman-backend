# frozen_string_literal: true

module Queries
  class AllProductCategoriesQuery < BaseQuery
    type [Types::Custom::Objects::ProductCategoryObject], null: false

    def resolve
      ProductCategory.all
    end
  end
end
