module Queries
  class FetchPersons < Queries::BaseQuery
    type [Types::Unions::PersonUnionType], null: false

    def resolve
      [Man.all, Woman.all].flatten
    end
  end
end
