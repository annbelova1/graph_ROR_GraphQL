FROM ruby:2.7.1

WORKDIR /rails-api

RUN apt-get update -y
RUN apt-get install -y graphviz

COPY Gemfile Gemfile.lock ./
RUN mkdir -p log && touch log/development.log

RUN gem install bundler

RUN bundle install

RUN gem install foreman

# Start the main process.
CMD ["foreman", "start", "-f", "Procfile"]
