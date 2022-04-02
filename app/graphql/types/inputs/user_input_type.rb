# frozen_string_literal: true

module Types
  module Inputs
    class UserInputType < Types::BaseInputObject
      argument :email, String
      argument :password, String
      argument :avatars, [Types::Inputs::AvatarInputType]
    end
  end
end
