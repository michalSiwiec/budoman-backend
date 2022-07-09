# frozen_string_literal: true

module Mutations
  class LoginUser < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::UserAuthenticationInput, required: true
    type Types::Custom::User

    def resolve(params)
      super(params)
      Graphql::LoginUserHandler.handle(params: @params, session: context[:session])
    end
  end
end
