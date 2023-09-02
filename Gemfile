source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5.3'
# Use Puma as the app server
gem 'puma', '~> 6.3.1'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.19'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.16.0', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 2.0.1'
# To comunicate with AWS
gem 'aws-sdk-s3', '~> 1.134'
# To use graphql
gem 'graphql', '~> 2.1.0'
# to process exel files
gem 'rubyXL', '~> 3.4.25'
# to generate token
gem 'jwt', '~> 2.7.1'
# to generate pdf
gem 'wicked_pdf', '~> 2.7.0'
gem 'wkhtmltopdf-binary', '~> 0.12.6'
# to work with env variables
gem 'dotenv-rails', '~> 2.8.1'
# to fix session on heroku
gem 'rails_same_site_cookie', '~> 0.1.9'
# To proces async jobs
gem 'sidekiq', '~> 7.1.2'
gem 'redis', '~> 5.0.7'
# To track errors
gem 'rollbar', '~> 3.4'
# To serving assets
gem 'sprockets-rails', '~> 3.4.2'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'pry'
  gem 'bundler-audit'
end

group :development do
  gem 'listen', '~> 3.8.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  # to mount graphql panel
  gem 'graphiql-rails'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end
