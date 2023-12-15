module Invoices
  class BuildStoragePayloadService
    extend Utils::CallableObject

    GeneratingInvoicePayloadError = Class.new(RollbarError)

    PATH_TO_INVOICE_TEMPLATE = 'app/views/invoice.html.erb'.freeze

    def initialize(order:)
      @order = order
    end

    def call
      path_to_invoice = generate_path_to_invoice
      invoice_in_base64 = generate_invoice_in_base64

      {
        bucket: Rails.application.config.aws_bucket,
        path: path_to_invoice,
        body: invoice_in_base64
      }
    rescue StandardError
      raise GeneratingInvoicePayloadError.new(message: 'Generating invoice payload error', context_data: { order_id: @order.id })
    end

    private

    def generate_path_to_invoice
      "users/#{@order.user_id}/invoices/#{@order.id}.pdf"
    end

    def generate_invoice_in_base64
      presenter = OrderPresenter.new(@order)
      pdf_html = ActionController::Base.render(inline: File.read(PATH_TO_INVOICE_TEMPLATE), locals: { presenter: presenter })
      WickedPdf.new.pdf_from_string(pdf_html)
    end
  end
end
