# frozen_string_literal: true

module Mutations
  class SubscribeUserToNewsletterMutation < BaseMutation
    argument :email, String, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      Graphql::SubscribeUserToNewsletterHandler.handle(@params)
    end
  end
end
