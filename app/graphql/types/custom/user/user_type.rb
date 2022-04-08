# frozen_string_literal: true

module Types
  module Custom
    module User
      class UserType < Types::BaseObject
        field :id, ID, null: false
        field :email, String, null: false
        field :password, String, null: false
        field :avatars, [Types::Custom::User::AvatarType], null: false
      end
    end
  end
end
