# frozen_string_literal: true

module Queries
  module Users
    class UserQuery < BaseQuery
      argument :user_id, ID, required: true
      type Types::Custom::Objects::Users::UserObject, null: false

      def resolve(params)
        User.find(params.fetch(:user_id))
      end
    end
  end
end
