# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class UserObject < Types::BaseObject
        field :id, ID, null: false
        field :email, String, null: false
        field :password, String, null: false
        field :avatars, [Types::Custom::Objects::AvatarObject], null: false
      end
    end
  end
end
