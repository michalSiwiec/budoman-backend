# Budoman-backend

## About project
Budoman-backend is a backend app for construction shop.
This is developed using:

- [Ruby](https://ruby-doc.org/3.0.6/) (3.0.6)
- [Rails](https://guides.rubyonrails.org/) (7.0.7)
- [PostgreSQL](https://www.postgresql.org/) (14.0.0)
- [Graphql](https://graphql-ruby.org/) (2.1.0)
- [RSpec](https://rspec.info/documentation/) (6.0.3)

## Requirements
- Ruby 3.0.6
- PostgreSQL 14

## Application setup
1. Make sure that you have filled .env file
2. Make sure that you have Docker installed on your local machine
3. Make sure that you have generated ssh keys with default path
4. Run the following commands to start the application:
```bash
SSH_PUB_KEY=$(cat ~/.ssh/id_rsa.pub) docker-compose build # Build images (perform only once)
docker-compose up # App should be available on port 3333
```

## Code quality
```bash
bundle exec rubocop # to turn on linter
bundle exec rspec # to turn on unit tests
```

## Tips
To turn on debugger inside container:
```bash
binding.pry # to stop performing app
docker attach budoman-backend-app # To have access to container's session
```

## Deploy
Application is automatically deployed on production through Github Actions.  
Deploy in performing after merge to master brach when action responsible for testing and linting app is succesfull.
