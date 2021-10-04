FROM ruby:2.7.3-alpine
ENV BUNDLER_VERSION=2.2.15
#RUN chmod +x entrypoints/docker-entrypoint.sh
RUN apk update && apk add gcc libc-dev make git libffi-dev openssl-dev python3-dev libxml2-dev libxslt-dev
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata

RUN gem install bundler -v 2.2.15

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install --jobs=3 --retry=3

COPY . ./

RUN bundle update

ENTRYPOINT ["sh", "config/docker-entrypoint.sh"]