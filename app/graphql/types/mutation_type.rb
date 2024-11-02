# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user,
          mutation: Mutations::Users::RegisterUserMutation,
          description: 'Register user'

    field :login_user,
          mutation: Mutations::Users::LoginUserMutation,
          description: 'Login user'

    field :logout_user,
          mutation: Mutations::Users::LogoutUserMutation,
          description: 'Logout user'

    field :subscribe_user_to_newsletter,
          mutation: Mutations::SubscribeUserToNewsletterMutation,
          description: 'Save user to newsletter'

    field :unsubscribe_user_from_newsletter,
          mutation: Mutations::UnsubscribeUserFromNewsletterMutation,
          description: 'Remove user from newsletter'

    field :update_user,
          mutation: Mutations::Users::UpdateUserMutation,
          description: 'Update user'

    field :remove_user,
          mutation: Mutations::Users::RemoveUserMutation,
          description: "Remove user's account"

    field :add_opinion,
          mutation: Mutations::AddOpinionMutation,
          description: "Add user's opinion"

    field :add_order,
          mutation: Mutations::AddOrderMutation,
          description: "Add user's order"

    field :monitor_resources,
          mutation: ::Mutations::MonitorResourcesMutation,
          description: "Publish resources's state on Kafka for monitoring purpose"
  end
end
