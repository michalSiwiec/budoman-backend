# frozen_string_literal: true

module Queries
  class GetOpinions < BaseQuery
    type [Types::Custom::Opinion::OpinionType], null: false

    def resolve
      Opinion.all
    end
  end
end
