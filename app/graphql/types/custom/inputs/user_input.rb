# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      class UserInput < Types::BaseInputObject
        argument :email, String, required: true
        argument :password, String, required: true
        argument :avatars, [Types::Custom::Inputs::AvatarInput], required: true
      end
    end
  end
end
