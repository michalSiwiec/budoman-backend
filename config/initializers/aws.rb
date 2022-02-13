require 'aws-sdk-core'

S3_BUCKET = Aws::S3::Resource.new.bucket(Rails.application.config.aws_bucket)
REGION = 'eu-central-1'

Aws.config.update(
  region: REGION,
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id),
    Rails.application.credentials.dig(:aws, :secret_access_key)
  )
)
