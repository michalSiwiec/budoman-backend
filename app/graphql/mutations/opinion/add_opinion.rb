# frozen_string_literal: true

module Mutations
  module Opinion
    class AddOpinion < BaseMutation
      argument :input, Types::Custom::Opinion::Inputs::OpinionInputType, required: true
      type Types::Custom::Opinion::OpinionType

      def resolve(params)
        super(params)
        Graphql::AddOpinionHandler.handle(@params)
      end
    end
  end
end
