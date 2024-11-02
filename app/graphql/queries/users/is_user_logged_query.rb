# frozen_string_literal: true

module Queries
  module Users
    class IsUserLoggedQuery < BaseQuery
      type Types::Custom::Objects::IsUserLoggedObject, null: false
  
      def resolve
        { user_id: context.fetch(:current_user)&.id }
      end
    end
  end
end
