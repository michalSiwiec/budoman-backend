# frozen_string_literal: true

module Mutations
  class UpdateUserDetailsMutation < Mutations::BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::UpdateUserDetailsInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      UpdateUserDetailsHandler.handle(@params)
    end
  end
end
