# frozen_string_literal: true

module Mutations
  module User
    class RegisterUser < BaseMutation
      argument :input, Types::Custom::User::Inputs::UserInputType, required: true
  
      type Types::Custom::User::UserType
  
      def resolve(params)
        super(params)
        Graphql::RegisterUserHandler.handle(@params)
      end
    end
  end
end
