# frozen_string_literal: true

module Types
  module Custom
    module Person
      class WomanType < Types::BaseObject
        implements Types::Interfaces::PersonType

        field :favourite_jacket, String, null: true
      end
    end
  end
end
