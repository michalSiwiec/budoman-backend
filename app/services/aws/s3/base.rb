module Aws
  module S3
    class Base < BaseService
      def initialize
        @aws_client = Aws::S3::Client.new
      end
    end
  end
end
