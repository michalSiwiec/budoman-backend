# frozen_string_literal: true

module Mutations
  class AddOrderMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::AddOrderInput, required: true
    type Types::Custom::Objects::Orders::OrderObject

    def resolve(params)
      super(params)
      ::Orders::HandleAddOrderService.call(params: @params)
    end
  end
end
