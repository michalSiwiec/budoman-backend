# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      class UserInput < Types::BaseInputObject
        argument :email, String
        argument :password, String
        argument :avatars, [Types::Custom::Inputs::AvatarInput]
      end
    end
  end
end
