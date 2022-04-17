# frozen_string_literal: true

module Mutations
  module User
    class RegisterUser < Mutations::BaseMutation
      argument :input, Types::Custom::User::Inputs::UserInputType, required: true

      type Types::Custom::User::UserType

      def resolve(params)
        super(params)
        Graphql::Users::RegisterUserHandler.handle(@params)
      end
    end
  end
end
