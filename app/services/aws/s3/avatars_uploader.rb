module Aws
  module S3
    class AvatarsUploader < Base
      def initialize(avatars:, id:)
        super()
        @user_id = id
        @avatars = avatars
        @uploaded_avatars_details = []
      end

      def call
        @avatars.each do |avatar|
          @avatar_builder = Aws::S3::AvatarBuilder.new(payload: avatar, id: @user_id)
          upload_to_aws
          add_avatar_details
        end
        @uploaded_avatars_details
      end

      private

      def upload_to_aws
        @aws_client.put_object(
          bucket: @avatar_builder.bucket,
          key: @avatar_builder.path,
          body: @avatar_builder.base64
        )
      end

      def add_avatar_details
        @uploaded_avatars_details << @avatar_builder.avatar_details
      end
    end
  end
end
