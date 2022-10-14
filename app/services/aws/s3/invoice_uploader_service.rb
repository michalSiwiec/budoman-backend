# frozen_string_literal: true

module Aws
  module S3
    class InvoiceUploaderService < S3BaseService
      def initialize(order)
        super()
        @order = order
      end

      def call
        upload_to_aws
      end

      private

      def upload_to_aws
        @aws_client.put_object(
          bucket: payload[:bucket],
          key: payload[:path],
          body: payload[:body]
        )
      end

      def payload
        @payload ||= Aws::S3::InvoiceBuilder.build(@order)
      end
    end
  end
end
