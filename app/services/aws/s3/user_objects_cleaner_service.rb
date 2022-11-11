# frozen_string_literal: true

module Aws
  module S3
    class UserObjectsCleanerService < S3BaseService
      def initialize(user)
        super()
        @user = user
      end

      def call
        handle_deletion
      end

      private

      def handle_deletion
        user_objects.each { |object| delete_object(object) }
      end

      def user_objects
        @aws_client.list_objects(bucket: bucket, prefix: directory).contents
      end

      def bucket
        @bucket ||= Rails.application.config.aws_bucket
      end

      def directory
        "users/#{@user.id}"
      end

      def delete_object(object)
        @aws_client.delete_object(bucket: bucket, key: object.key)
      end
    end
  end
end
