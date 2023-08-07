FROM ruby:2.7.2

# SETUP SSH
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /root/.ssh
ARG SSH_PUB_KEY
RUN echo "$SSH_PUB_KEY" > /root/.ssh/authorized_keys

# APP INSTALLATION
WORKDIR /budoman-backend
COPY . /budoman-backend/
RUN chmod u+x /budoman-backend/bin/container-startup.sh
RUN bundle config set force_ruby_platform true
RUN bundle install

# START THE APPLICATION
ENTRYPOINT ["/budoman-backend/bin/container-startup.sh"]
