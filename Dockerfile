FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /born-back
WORKDIR /born-back
COPY Gemfile /born-back/Gemfile
COPY Gemfile.lock /born-back/Gemfile.lock
RUN bundle install
COPY . /born-back