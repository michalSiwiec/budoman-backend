# frozen_string_literal: true

module Mutations
  class UnsubscribeUserFromNewsletterMutation < GraphQL::Schema::Mutation
    argument :email, String, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      ::Newsletters::UnsubscribeFromNewsletterService.call(email: params[:email])
    end
  end
end
