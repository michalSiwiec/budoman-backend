FROM ruby:2.7.2

WORKDIR /budoman-backend
COPY . /budoman-backend/

RUN bundle config set force_ruby_platform true
RUN bundle install

CMD ["-p", "3333"]
ENTRYPOINT ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
