# frozen_string_literal: true

module Queries
  module Opinions
    class OpinionsQuery < BaseQuery
      argument :input, Types::Custom::Inputs::Filtrations::Opinions::OpinionInput, required: false
      type Types::Custom::Objects::Opinions::OpinionsWithAllQuantityObject, null: false

      def resolve(params)
        {
          opinions: OpinionQuery.new(params).call,
          all_opinions_quantity: Opinion.count
        }
      end
    end
  end
end
