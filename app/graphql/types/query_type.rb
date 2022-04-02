# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :authors, resolver: Queries::FetchAuthors, description: 'returns array of Authors'
    field :author, resolver: Queries::FetchAuthor, description: 'returns author based on id'
    field :books, resolver: Queries::FetchBooks, description: 'returns array of books'
    field :book, resolver: Queries::FetchBook, description: 'returns book based on id'
    field :woman, resolver: Queries::FetchWomen, description: 'returns array of women'
    field :men, resolver: Queries::FetchMen, description: 'returns array of men'
    field :persons, resolver: Queries::FetchPersons, description: 'returns array of men and women'
  end
end
