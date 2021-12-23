module Types
  module Custom
    class AuthorType < Types::BaseObject
      field :id, ID, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
      field :book, Types::Custom::BookType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
