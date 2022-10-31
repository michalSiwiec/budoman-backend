# frozen_string_literal: true

module Mutations
  class UnsubscribeUserFromNewsletterMutation < GraphQL::Schema::Mutation
    argument :email, String, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      UnsubscribeUserFromNewsletterHandler.handle(params[:email])
    end
  end
end
