# Budoman-backend

## About project
Budoman-backend is a backend app for construction shop.
This is developed using:

- [Ruby](https://ruby-doc.org/) (2.7.2)
- [Rails](https://guides.rubyonrails.org/) (5.2.6)
- [PostgreSQL](https://www.postgresql.org/) (14.0.0)
- [Graphql](https://graphql-ruby.org/) (2.0.15)
- [RSpec](https://rspec.info/documentation/) (5.0.0)

## Requirements
- Ruby 2.7.2
- PostgreSQL 14

## Application setup
1. Make sure that you have filled .env file
2. Make sure that you have Docker installed on your local machine
3. Run the following command to start the application:
```bash
docker-compose up # app should be available on 3333 port
```

## Code quality
```bash
bundle exec rubocop # to turn on linter
bundle exec rspec # to turn on unit tests
```
