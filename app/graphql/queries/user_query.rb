# frozen_string_literal: true

module Queries
  class UserQuery < BaseQuery
    argument :user_id, ID, required: true
    type Types::Custom::Objects::UserObject, null: false

    def resolve(params)
      User.find(params[:user_id])
    end
  end
end
