# frozen_string_literal: true

module Types
  module Custom
    class User < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :password, String, null: false
      field :avatars, [Types::Custom::Avatar], null: false
    end
  end
end
