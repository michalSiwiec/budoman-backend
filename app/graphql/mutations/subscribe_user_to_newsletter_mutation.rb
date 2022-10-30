# frozen_string_literal: true

module Mutations
  class SubscribeUserToNewsletterMutation < BaseMutation
    argument :input, Types::Custom::Inputs::Mutations::SubscribeUserToNewsletterInput, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      super(params)
      SubscribeUserToNewsletterHandler.handle(@params)
    end
  end
end
