# frozen_string_literal: true

module Queries
  class FetchBook < Queries::BaseQuery
    argument :id, ID, required: true
    type Types::Custom::BookType, null: false

    def resolve(params)
      Book.find(params[:id])
    end
  end
end
