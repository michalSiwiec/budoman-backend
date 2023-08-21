# frozen_string_literal: true

module Mutations
  class RegisterUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::RegisterUserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      ::Users::HandleRegisterUserService.call(params: @params, session: context[:session])
    end
  end
end
