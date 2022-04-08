# frozen_string_literal: true

module Types
  module Custom
    module User
      module Inputs
        class UserInputType < Types::BaseInputObject
          argument :email, String
          argument :password, String
          argument :avatars, [Types::Custom::User::Inputs::AvatarInputType]
        end
      end
    end
  end
end
