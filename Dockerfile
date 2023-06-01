FROM ruby:3.1.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /quick-quill
WORKDIR /quick-quill

COPY Gemfile /quick-quill//Gemfile
COPY Gemfile.lock /quick-quill//Gemfile.lock

RUN bundle install
COPY . /quick-quill/
