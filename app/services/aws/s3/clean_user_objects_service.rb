module Aws
  module S3
    class CleanUserObjectsService < S3BaseService
      def initialize(user:)
        super()
        @user = user
      end

      def call
        bucket = Rails.application.config.aws_bucket
        directory = "users/#{@user.id}"
        user_objects = @aws_client.list_objects(bucket: bucket, prefix: directory).contents

        user_objects.each do |object|
          @aws_client.delete_object(bucket: bucket, key: object.key)  
        end
      end
    end
  end
end
