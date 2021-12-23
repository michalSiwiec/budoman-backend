module Queries
  class FetchMen < Queries::BaseQuery
    type [Types::Custom::Person::ManType], null: false

    def resolve
      Man.all
    end
  end
end
