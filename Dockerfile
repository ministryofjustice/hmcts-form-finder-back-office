FROM ruby:2.3.1



RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /rails

ENV APP_PORT 3000
ENV DOCKER_STATE=create

EXPOSE $APP_PORT

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
ADD . $APP_HOME

RUN bundle install

#RUN bundle exec rake assets:precompile RAILS_ENV=production SECRET_TOKEN=blah

#RUN bundle exec rake static_pages:generate RAILS_ENV=production SECRET_TOKEN=blah

CMD ./run.sh
