# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class UserObject < Types::BaseObject
        field :id, ID, null: false
        field :email, String, null: false
        field :password, String, null: false
        field :avatars, [Types::Custom::Objects::AvatarObject], null: false
        field :name, String, null: true
        field :surname, String, null: true
        field :phone_number, String, null: true
        field :street, String, null: true
        field :city, String, null: true
        field :postal_code, String, null: true
      end
    end
  end
end
