# frozen_string_literal: true

module Types
  module Custom
    class Opinion < Types::BaseObject
      field :id, ID, null: false
      field :content, String, null: false
      field :mark, Integer, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :user, Types::Custom::User, null: false
    end
  end
end
