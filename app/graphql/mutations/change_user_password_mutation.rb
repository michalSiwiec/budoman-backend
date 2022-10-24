# frozen_string_literal: true

module Mutations
  class ChangeUserPasswordMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::ChangeUserPasswordInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      ChangeUserPasswordHandler.handle(@params)
    end
  end
end
