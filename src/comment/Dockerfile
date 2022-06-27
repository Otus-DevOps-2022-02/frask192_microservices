FROM ubuntu:16.04
RUN apt-get update \
 && apt-get install -y ruby-full ruby-dev build-essential \
 && gem install bundler --no-ri --no-rdoc \
 && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

ENTRYPOINT ["puma"]
