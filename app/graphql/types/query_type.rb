# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :products, resolver: Queries::Products, description: 'Returns array of products'
    field :opinions, resolver: Queries::Opinions, description: 'Returns array of opinions'
  end
end
