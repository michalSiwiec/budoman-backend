# frozen_string_literal: true

module Queries
  class OpinionsQuery < BaseQuery
    type [Types::Custom::Objects::OpinionObject], null: false

    def resolve
      Opinion.all
    end
  end
end
