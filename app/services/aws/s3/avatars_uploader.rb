module Aws
  module S3
    class AvatarsUploader < Base
      def initialize(avatars)
        super()
        @bucket = Rails.application.config.aws_bucket
        @avatars = avatars
      end
  
      def call
        @avatars.each { |avatar| upload_to_aws(avatar) }
      end

      private

      def upload_to_aws(avatar)
        @aws_client.put_object(bucket: @bucket, key: avatar[:storage_path])
      end
    end
  end
end
