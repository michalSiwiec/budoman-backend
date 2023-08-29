# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def resolve(params)
      @params = params.fetch(:input).to_h
    end
  end
end
