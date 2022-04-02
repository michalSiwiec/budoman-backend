# frozen_string_literal: true

module Types
  module Custom
    module Person
      class ManType < Types::BaseObject
        implements Types::Interfaces::PersonType

        field :favourite_car, String, null: true
      end
    end
  end
end
