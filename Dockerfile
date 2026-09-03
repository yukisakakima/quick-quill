FROM ruby:3.1.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /quick-quill
COPY Gemfile /quick-quill/Gemfile
COPY Gemfile.lock /quick-quill/Gemfile.lock
RUN bundle install
COPY . /quick-quill/

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

RUN chmod +x bin/rails
RUN SECRET_KEY_BASE=dummy bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]