# frozen_string_literal: true

module Aws
  module S3
    class S3BaseService < BaseService
      def initialize
        super()
        @aws_client = Aws::S3::Client.new
      end
    end
  end
end
