# frozen_string_literal: true

module Queries
  class FetchAuthor < Queries::BaseQuery
    argument :id, ID, required: true
    type Types::Custom::AuthorType, null: false

    def resolve(params)
      Author.find(params[:id])
    end
  end
end
