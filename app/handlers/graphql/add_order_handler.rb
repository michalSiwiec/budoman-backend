# frozen_string_literal: true

module Graphql
  class AddOrderHandler < BaseHandler
    def initialize(params)
      @params = params
    end

    def handle
      create_order
      generate_invoice
      @order
    end

    private

    def create_order
      @order ||= Order.create!(@params)
    end

    def generate_invoice
    end
  end
end
