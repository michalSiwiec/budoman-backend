# frozen_string_literal: true

module Mutations
  module Users
    class LogoutUserMutation < Mutations::BaseMutation
      argument :input, Types::Custom::Inputs::Mutations::LogoutUserInput, required: true
      type Types::Custom::Objects::UserObject
  
      def resolve(params)
        super(params)
        ::Users::HandleLogoutUserService.call(params: @params, session: context.fetch(:session))
      end
    end
  end
end
