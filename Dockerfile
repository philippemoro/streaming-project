FROM ruby:2.6-alpine

ENV DATABASE_NAME=streaming_project_development
ENV DATABASE_USER=postgres
ENV DATABASE_PASSWORD=postgres
ENV DATABASE_HOST=postgres
ENV DATABASE_PORT=5432
ENV RAILS_ENV=development

RUN apk add --no-cache --update \
      build-base \
      bash \
      tzdata \
      postgresql-dev \
      postgresql-client \
      libxslt-dev \
      libxml2-dev \
      imagemagick \
      git \
      less

RUN gem install bundler -v 2.2.13

WORKDIR /usr/local/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle config && bundle install --jobs 4 --retry 2

COPY . ./

EXPOSE 3000

ENTRYPOINT [".docker-entrypoint.sh"]
CMD [".docker-app-init.sh"]
