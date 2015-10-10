FROM ruby:2.2.1
MAINTAINER Alex B <me@alexb.io>

WORKDIR /usr/src/app

ADD . /usr/src/app

RUN bundle install -j4 --system

EXPOSE 9292

CMD ["bundle", "exec", "puma", "config.ru"]
