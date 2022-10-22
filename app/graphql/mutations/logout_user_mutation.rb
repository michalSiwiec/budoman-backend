# frozen_string_literal: true

module Mutations
  class LogoutUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::LogoutUserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      LogoutUserHandler.handle(params: @params, session: context[:session])
    end
  end
end
