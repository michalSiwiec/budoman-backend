# frozen_string_literal: true

module Types
  module Custom
    module Objects
      class OpinionObject < Types::BaseObject
        field :id, ID, null: false
        field :content, String, null: false
        field :mark, Integer, null: false
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
        field :user, Types::Custom::Objects::UserObject, null: false
      end
    end
  end
end
