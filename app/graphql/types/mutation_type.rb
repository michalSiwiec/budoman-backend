# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::User::RegisterUser, description: 'Register user'
    field :subscribe_to_newsletter, mutation: Mutations::User::SaveOnNewsletter, description: 'Save user to newsletter'
  end
end
