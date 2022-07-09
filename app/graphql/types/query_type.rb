# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_products, resolver: Queries::AllProducts, description: 'Returns array of products'
    field :promoted_products, resolver: Queries::PromotedProducts, description: 'Returns array of promoted products'
    field :products_cathegories,
          resolver: Queries::AllProductCathegories,
          description: 'Returns array fo products cathegories'
    field :opinions, resolver: Queries::Opinions, description: 'Returns array of opinions'
  end
end
