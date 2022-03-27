module Aws
  module S3
    class AvatarBuilder
      attr_reader :bucket

      def initialize(payload:, id:)
        @aws_path = Rails.application.config.aws_path
        @bucket = Rails.application.config.aws_bucket
        @payload = payload
        @user_id = id
      end

      def base64
        Base64.decode64(@payload[:base64].split(',').second)
      end

      def path
        "#{@user_id}/#{@payload[:file_name]}"
      end

      def avatar_details
        { main: @payload[:main], storage_path: full_path }
      end

      private

      def full_path
        "https://#{bucket}.#{@aws_path}/#{path}"
      end
    end
  end
end
