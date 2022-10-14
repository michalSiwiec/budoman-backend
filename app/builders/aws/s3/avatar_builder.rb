# frozen_string_literal: true

module Aws
  module S3
    class AvatarBuilder
      attr_writer :avatar

      def initialize(user_id)
        @user_id = user_id
      end

      def build
        {
          base64: base64,
          path: path,
          bucket: config.aws_bucket,
          details: details
        }
      end

      private

      def base64
        Base64.decode64(@avatar[:base64].split(',').second)
      end

      def path
        "users/#{@user_id}/avatars/#{@avatar[:file_name]}"
      end

      def details
        { main: @avatar[:main], storage_path: full_path }
      end

      def full_path
        "https://#{config.aws_bucket}.#{config.aws_path}/#{path}"
      end

      def config
        @config ||= Rails.application.config
      end
    end
  end
end
