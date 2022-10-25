# frozen_string_literal: true

require 'aws-sdk-core'

Aws.config.update(
  region: Rails.application.credentials[:AWS_REGION],
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id),
    Rails.application.credentials.dig(:aws, :secret_access_key)
  )
)
