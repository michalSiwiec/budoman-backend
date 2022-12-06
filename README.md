# Budoman-backend

## About project

Budoman-backend is a backend part-creating microservice for construction shop.
This is developed using:

- [Ruby](https://ruby-doc.org/) (2.7.2)
- [Rails](https://guides.rubyonrails.org/) (5.2.6)
- [PostgreSQL](https://www.postgresql.org/) (14.0.0)
- [Graphql](https://graphql-ruby.org/) (2.0.15)
- [RSpec](https://rspec.info/documentation/) (5.0.0)

## Requirements

- Ruby 2.7.2
- PostgreSQL 14

## Setup

Use the package manager [bundler](https://bundler.io/) to install dependencies.

```bash
bundle i # To install dependencies
cp .env.sample .env # To set env variables
bundle exec rails db:create db:migrate db:seed # To setup database
```

## Usage

To start app use:
```bash
rails s -p 3333
```

## Code quality

I use linter for ruby files. To run linters:

```bash
bundle exec rubocop
```

## Tests

### Unit
```bash
bundle exec rspec
```
