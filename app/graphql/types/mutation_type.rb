# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::User::RegisterUser, description: 'Register user'
  end
end
