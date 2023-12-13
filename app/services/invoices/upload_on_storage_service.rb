module Invoices
  class UploadOnStorageService < BaseService
    def initialize(order:)
      super()
      @order = order
    end

    def call
      invoice_payload = generate_invoice_payload
      upload_on_storage(payload: invoice_payload)
    end

    private

    def generate_invoice_payload
      ::Aws::S3::InvoiceBuilder.build(order: @order)
    end

    def upload_on_storage(payload:)
      ::Aws::S3Service.new.put_object(key: payload.fetch(:path), body: payload.fetch(:body))
    end
  end
end
