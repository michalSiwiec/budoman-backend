# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser, description: 'Register user'
    field :subscribe_user_to_newsletter,
          mutation: Mutations::SubscribeUserToNewsletter,
          description: 'Save user to newsletter'
    field :add_opinion, mutation: Mutations::AddOpinion, description: "Add user's opinion"
  end
end
