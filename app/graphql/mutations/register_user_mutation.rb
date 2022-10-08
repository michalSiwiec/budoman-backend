# frozen_string_literal: true

module Mutations
  class RegisterUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::UserInput, required: true
    type Types::Custom::User

    def resolve(params)
      super(params)
      Graphql::RegisterUserHandler.handle(@params)
    end
  end
end
