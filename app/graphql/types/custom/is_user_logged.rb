# frozen_string_literal: true

module Types
  module Custom
    class IsUserLogged < Types::BaseObject
      field :is_logged, Boolean, null: false
    end
  end
end
