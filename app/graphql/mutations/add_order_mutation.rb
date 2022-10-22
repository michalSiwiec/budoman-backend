# frozen_string_literal: true

module Mutations
  class AddOrderMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::AddOrderInput, required: true
    type Types::Custom::Objects::OrderObject

    def resolve(params)
      super(params)
      AddOrderHandler.handle(@params)
    end
  end
end
