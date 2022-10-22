FROM ruby:3.1.2-alpine3.16

RUN apk update && apk add --no-cache build-base git \
  mysql-dev mysql-client \
  nodejs yarn && \
  rm -rf /var/lib/apt/lists/*

RUN gem update --system

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app