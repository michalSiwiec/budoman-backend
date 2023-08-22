# frozen_string_literal: true

module Mutations
  class LoginUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::LoginUserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      ::Users::HandleLoginUserService.call(params: @params, session: context[:session])
    end
  end
end
