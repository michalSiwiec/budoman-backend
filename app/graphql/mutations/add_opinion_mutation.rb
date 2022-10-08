# frozen_string_literal: true

module Mutations
  class AddOpinionMutation < BaseMutation
    argument :input, Types::Custom::Inputs::OpinionInput, required: true
    type Types::Custom::Objects::OpinionObject

    def resolve(params)
      super(params)
      Graphql::AddOpinionHandler.handle(@params)
    end
  end
end
