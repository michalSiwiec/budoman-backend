# frozen_string_literal: true

module Aws
  module S3
    class AvatarsUploaderService < BaseService
      def initialize(avatars:, user_id:)
        super()
        @user_id = user_id
        @avatars = avatars
      end

      def call
        @avatars.each do |avatar|
          avatar_builder.avatar = avatar
          @payload = avatar_builder.build

          upload_to_aws
          add_avatar_details
        end

        uploaded_avatars_details
      end

      private

      def avatar_builder
        @avatar_builder ||= Aws::S3::AvatarBuilder.new(@user_id)
      end

      def uploaded_avatars_details
        @uploaded_avatars_details ||= []
      end

      def upload_to_aws
        @aws_client.put_object(
          body: @payload[:base64],
          bucket: @payload[:bucket],
          key: @payload[:path]
        )
      end

      def add_avatar_details
        uploaded_avatars_details << @payload[:details]
      end
    end
  end
end
