# frozen_string_literal: true

module Mutations
  class UpdateUserMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::UpdateUserInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      UpdateUserHandler.handle(@params)
    end
  end
end
