# frozen_string_literal: true

class OlxBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
