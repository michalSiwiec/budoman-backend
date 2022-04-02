# frozen_string_literal: true

Rollbar.configure do |config|
  config.access_token = 'c719d6e0a7fa4d0ca24c0f60b262aaeb'
  config.enabled = false if Rails.env.test?
  config.environment = Rails.env
end
