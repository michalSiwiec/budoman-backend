# frozen_string_literal: true

module Mutations
  class RemoveUserMutation < GraphQL::Schema::Mutation
    argument :user_id, ID, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      RemoveUserHandler.handle(user_id: params[:user_id], session: context[:session])
    end
  end
end
