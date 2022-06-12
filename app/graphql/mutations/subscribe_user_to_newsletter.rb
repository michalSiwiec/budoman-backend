# frozen_string_literal: true

module Mutations
  class SubscribeUserToNewsletter < BaseMutation
    argument :email, String, required: true
    type Types::Custom::User

    def resolve(params)
      super(params)
      Graphql::SubscribeUserToNewsletterHandler.handle(@params)
    end
  end
end
