# frozen_string_literal: true

module Queries
  class OpinionsQuery < BaseQuery
    argument :input, Types::Custom::Inputs::Filtrations::OpinionFiltrationInput, required: false
    type Types::Custom::Objects::Opinions::OpinionsWithAllQuantityObject, null: false

    # Czy tu nie mam zwracac all_opinions_quantity z opinionQuery
    def resolve(params)
      {
        opinions: OpinionQuery.new(params).call,
        all_opinions_quantity: Opinion.count
      }
    end
  end
end
