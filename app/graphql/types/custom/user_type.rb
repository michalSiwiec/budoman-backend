module Types
  module Custom
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :password, String, null: false
      field :avatars, [Types::Custom::AvatarType], null: false
    end
  end
end
