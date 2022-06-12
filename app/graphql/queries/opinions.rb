# frozen_string_literal: true

module Queries
  class Opinions < BaseQuery
    type [Types::Custom::Opinion], null: false

    def resolve
      Opinion.all
    end
  end
end
