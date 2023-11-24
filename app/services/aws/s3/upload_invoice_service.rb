module Aws
  module S3
    class UploadInvoiceService < S3BaseService
      def initialize(order:)
        super()
        @order = order
      end

      def call
        upload_to_aws
      end

      private

      def upload_to_aws
        payload = ::Aws::S3::InvoiceBuilder.build(order: @order)
        @aws_client.put_object(bucket: payload.fetch(:bucket),
                               key: payload.fetch(:path),
                               body: payload.fetch(:body))
      end
    end
  end
end
