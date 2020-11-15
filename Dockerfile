FROM ruby:2.7.2
LABEL maintainer="rich@cukehub.com"

RUN mkdir /app

WORKDIR /app

COPY Gemfile* /app/

RUN bundle
