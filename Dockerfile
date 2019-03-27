FROM ruby:2.5
RUN apt-get update -qq
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs postgresql-client
RUN mkdir /trello
WORKDIR /trello
COPY Gemfile /trello/Gemfile
COPY Gemfile.lock /trello/Gemfile.lock
RUN bundle install
COPY . /trello

# add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
CMD entrypoint.sh
EXPOSE 3000

# start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
