FROM ruby:3.1.2

RUN apt-get update
RUN apt-get -y install postgresql

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    BUNDLE_JOBS=2 \
    GEM_HOME=/bundle \
    BUNDLE_GEMFILE=/web/Gemfile

WORKDIR /web

# COPY Gemfile Gemfile.lock ./web
# RUN bundle install

ADD . ./web

CMD ["bash"]
