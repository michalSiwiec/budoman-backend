# frozen_string_literal: true

module Mutations
  class LogoutUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::LogoutUserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      Graphql::LogoutUserHandler.handle(params: @params, session: context[:session])
    end
  end
end
