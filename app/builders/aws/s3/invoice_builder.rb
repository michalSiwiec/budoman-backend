# frozen_string_literal: true

module Aws
  module S3
    class InvoiceBuilder < BaseBuilder
      def initialize(order)
        super()
        @order = order
      end

      def build
        {
          bucket: config.aws_bucket,
          path: path,
          body: body
        }
      end

      private

      def config
        @config ||= Rails.application.config
      end

      def path
        "users/#{@order.user_id}/invoices/#{@order.id}.pdf"
      end

      def body
        WickedPdf.new.pdf_from_string(pdf_html)
      end

      def pdf_html
        ActionController::Base.new.render_to_string(file: layout_path, locals: { presenter: presenter })
      end

      def layout_path
        'app/views/layouts/invoice.html.erb'
      end

      def presenter
        OrderPresenter.new(@order)
      end
    end
  end
end
