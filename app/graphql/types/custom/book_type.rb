module Types
  module Custom
    class BookType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: true
      field :authors, [Types::Custom::AuthorType], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :some_other, String, null: false

      def some_other
        "title: #{object.title}"
      end
    end
  end
end
