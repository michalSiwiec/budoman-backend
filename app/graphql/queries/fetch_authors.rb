# frozen_string_literal: true

module Queries
  class FetchAuthors < Queries::BaseQuery
    type [Types::Custom::AuthorType], null: false

    def resolve
      Author.all
    end
  end
end
