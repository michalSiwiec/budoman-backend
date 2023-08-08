source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# To comunicate with AWS
gem 'aws-sdk-s3', '~> 1.112'
# To use graphql
gem 'graphql'
# to process exel files
gem 'rubyXL'
# to generate token
gem 'jwt'
# to generate pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# to work with crontab
gem 'whenever', require: false
# to work with env variables
gem 'dotenv-rails'
# to fix session on heroku
gem 'rails_same_site_cookie'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # to mount graphql panel
  gem 'graphiql-rails'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec-rails' # https://rspec.info/documentation/5.0/rspec-rails/
  gem 'factory_bot_rails' # https://www.rubydoc.info/gems/factory_bot_rails/6.2.0
  gem 'shoulda-matchers' # https://matchers.shoulda.io/docs/v5.3.0/
  gem 'database_cleaner' # https://github.com/DatabaseCleaner/database_cleaner
end
