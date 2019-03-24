FROM ruby:2.6.1

# need to update repo
RUN apt-get update -qq && apt-get install -y build-essential \
    && apt-get install -y apt-utils \
    && apt-get install -y wget \
    && apt-get install -y libpq-dev \
    && apt-get install -y postgresql-contrib \
    && apt-get install -y libxml2-dev libxslt1-dev \
    && apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xvfb \
    && apt-get install -y sudo curl nodejs

RUN bundle config build.nokogiri --use-system-libraries

# update your sources
RUN apt-get update

RUN gem install foreman

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
WORKDIR /app

COPY . /app/

