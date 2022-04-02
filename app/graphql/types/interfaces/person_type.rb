# frozen_string_literal: true

module Types
  module Interfaces
    module PersonType
      include Types::BaseInterface

      field :id, ID, null: false
      field :name, String, null: true
      field :surname, String, null: true
      field :age, Integer, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
