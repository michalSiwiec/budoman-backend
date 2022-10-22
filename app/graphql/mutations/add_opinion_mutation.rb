# frozen_string_literal: true

module Mutations
  class AddOpinionMutation < BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::OpinionInput, required: true
    type Types::Custom::Objects::Opinions::OpinionObject

    def resolve(params)
      super(params)
      AddOpinionHandler.handle(@params)
    end
  end
end
