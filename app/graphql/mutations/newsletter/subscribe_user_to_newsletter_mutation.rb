# frozen_string_literal: true

module Mutations
  module Newsletter
    class SubscribeUserToNewsletterMutation < BaseMutation
      argument :input, Types::Custom::Inputs::Mutations::Newsletter::SubscribeUserToNewsletterInput, required: true
      type Types::Custom::Objects::UserObject

      def resolve(params)
        super(params)
        ::Newsletters::SubscribeToNewsletterService.call(params: @params)
      end
    end
  end
end
