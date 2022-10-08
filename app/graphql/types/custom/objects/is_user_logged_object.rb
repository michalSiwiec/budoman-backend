# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class IsUserLoggedObject < Types::BaseObject
        field :is_logged, Boolean, null: false
      end
    end
  end
end
