module Invoices
  class UploadOnStorageService
    extend Utils::CallableObject

    def initialize(order:)
      super()
      @order = order
    end

    def call
      invoice_payload = build_invoice_payload
      upload_on_storage(payload: invoice_payload)
    end

    private

    def build_invoice_payload
      ::Invoices::BuildStoragePayloadService.call(order: @order)
    end

    def upload_on_storage(payload:)
      ::Services::Aws::S3Service.new.put_object(key: payload.fetch(:path), body: payload.fetch(:body))
    end
  end
end
