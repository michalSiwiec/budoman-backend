# frozen_string_literal: true

module Graphql
  class AddOrderHandler < BaseHandler
    def initialize(params)
      @order_params = params.except(:products_order)
      @products_order_params = params[:products_order]
    end

    def handle
      create_order
      generate_invoice
      @order
    end

    private

    def create_order
      @order ||= Order.new(@order_params)
      @products_order_params.each do |product_order_params|
        @order.products_orders << ProductsOrder.new(product_order_params)
      end
      @order.save!
    end

    def generate_invoice
      Aws::S3::InvoiceUploaderService.call(@order)
    end
  end
end
