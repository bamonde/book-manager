FROM ruby:3.1.2

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

RUN apt-get update
RUN apt-get -y install postgresql

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    BUNDLE_JOBS=2 \
    GEM_HOME=/bundle \
    BUNDLE_GEMFILE=/web/Gemfile

WORKDIR /web

# COPY Gemfile Gemfile.lock ./
# RUN bundle install

ADD . ./web

CMD ["bash"]
