#!/bin/bash

# Start the SSH service
service ssh start

# Setup database
rails runner "ActiveRecord::Base.establish_connection; exit ActiveRecord::Base.connection.active?" 
DB_EXISTS=$?

# If the database does not exist, create and seed it
if [[ $DB_EXISTS -ne 0 ]]; then
    echo "Database does not exist. Setuping database..."
    rails db:create db:migrate db:seed
else
  echo "Database exists. Performing migration..."
  rails db:migrate
fi

# Start main application
bundle exec rails server -b 0.0.0.0 -p 3333
