FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /born-back
WORKDIR /born-back
COPY Gemfile /born-back/Gemfile
COPY Gemfile.lock /born-back/Gemfile.lock
RUN bundle install
COPY . /born-back

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]