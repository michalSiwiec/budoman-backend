module Queries
  class FetchWomen < Queries::BaseQuery
    type [Types::Custom::Person::WomanType], null: false

    def resolve
      Woman.all
    end
  end
end
