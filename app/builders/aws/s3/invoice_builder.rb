module Aws
  module S3
    class InvoiceBuilder < BaseBuilder
      PATH_TO_INVOICE_TEMPLATE = 'app/views/invoice.html.erb'

      def initialize(order:)
        super()
        @order = order
      end

      def build
        path_to_invoice = generate_path_to_invoice
        invoice_in_base_64 = generate_invoice_in_base_64
        
        {
          bucket: Rails.application.config.aws_bucket,
          path: path_to_invoice,
          body: invoice_in_base_64
        }
      end

      private

      def generate_path_to_invoice
        "users/#{@order.user_id}/invoices/#{@order.id}.pdf"
      end

      def generate_invoice_in_base_64
        presenter = OrderPresenter.new(@order)
        pdf_html = ActionController::Base.new.render_to_string(file: PATH_TO_INVOICE_TEMPLATE, locals: { presenter: presenter })
        WickedPdf.new.pdf_from_string(pdf_html)
      end
    end
  end
end
