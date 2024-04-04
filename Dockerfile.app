FROM ruby:3.1.2-slim
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    telnet \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update -qq && apt-get install -y postgresql-client libpq-dev

# cache bundle install
WORKDIR /tmp
COPY ./Gemfile* ./
RUN bundle install

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails db:create && rails db:migrate && rails s -b '0.0.0.0'