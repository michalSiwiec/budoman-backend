# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Users
        class IsUserLoggedObject < Types::BaseObject
          field :user_id, ID, null: true
        end
      end
    end
  end
end
