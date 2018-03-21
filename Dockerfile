FROM ruby:2.5.0-alpine3.7

# install git because it's used in the gemspec
RUN apk update && \
    apk add git

WORKDIR /app
COPY . /app/
RUN bundle install
