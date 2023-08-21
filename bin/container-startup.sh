#!/bin/bash

# Start the SSH service
service ssh start

# Start cron service
service cron start

# Start sidekiq in background
bundle exec sidekiq &

# Setup database
rails runner "ActiveRecord::Base.establish_connection; exit ActiveRecord::Base.connection.active?" 
DB_EXISTS=$?

# If the database does not exist, create and seed it. Otherwise perform migration
if [[ $DB_EXISTS -ne 0 ]]; then
    echo "Database does not exist. Setuping database..."
    rails db:create db:migrate db:seed
else
  echo "Database exists. Performing migration..."
  rails db:migrate
fi

# Make sure that pid file doesn't exist
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Start main application
bundle exec rails server -b 0.0.0.0 -p 3333
