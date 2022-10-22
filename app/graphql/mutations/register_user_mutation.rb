# frozen_string_literal: true

module Mutations
  class RegisterUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::UserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      RegisterUserHandler.handle(@params)
    end
  end
end
