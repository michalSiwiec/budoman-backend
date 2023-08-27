# frozen_string_literal: true

require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module OlxBackend
  class Application < Rails::Application
    config.load_defaults 5.2
    # For authorization
    config.api_only = false
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    # For work with S3
    config.aws_path = 's3.eu-central-1.amazonaws.com'
    # For mailers
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    config.action_mailer.deliver_later_queue_name = :default
    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'mail.google.com',
      user_name: 'siwiec.michal724@gmail.com',
      password: ENV['SMTP_PASSWORD'],
      authentication: ENV['SMTP_AUTHENTICATION'],
      enable_starttls_auto: true,
    }
    # For async jobs
    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'] }
  end
end
