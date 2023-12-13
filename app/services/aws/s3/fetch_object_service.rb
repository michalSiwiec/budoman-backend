module Aws
  module S3
    class FetchObjectService < S3BaseService
      def initialize(key:, bucket: Rails.configuration.aws_bucket)
        super()
        @bucket = bucket
        @key = key
      end

      def call
        fetch_object
      end

      private

      def fetch_object
        @aws_client.get_object(bucket: @bucket, key: @key)
      end
    end
  end
end
