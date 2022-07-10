# frozen_string_literal: true

module Queries
  class IsUserLogged < BaseQuery
    type Types::Custom::IsUserLogged, null: false

    def resolve
      { is_logged: context[:current_user].present? }
    end
  end
end
