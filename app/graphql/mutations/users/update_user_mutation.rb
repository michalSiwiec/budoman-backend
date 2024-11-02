# frozen_string_literal: true

module Mutations
  module Users
    class UpdateUserMutation < Mutations::BaseMutation
      argument :input, Types::Custom::Inputs::Mutations::UpdateUserInput, required: true
      type Types::Custom::Objects::UserObject
  
      def resolve(params)
        super(params)
        ::Users::UpdateUserService.call(params: @params)
      end
    end
  end
end
