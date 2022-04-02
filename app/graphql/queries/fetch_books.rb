# frozen_string_literal: true

module Queries
  class FetchBooks < Queries::BaseQuery
    type [Types::Custom::BookType], null: false

    def resolve
      Book.all
    end
  end
end
