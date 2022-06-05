# frozen_string_literal: true

module Types
  module Custom
    module Opinion
      class OpinionType < Types::BaseObject
        field :id, ID, null: false
        field :content, String, null: false
        field :mark, Integer, null: false
        field :user, Types::Custom::User::UserType, null: false
      end
    end
  end
end
