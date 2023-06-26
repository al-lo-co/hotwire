# Dockerfile
FROM ruby:latest

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem install rails

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --quiet

COPY . .

EXPOSE 3000