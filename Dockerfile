FROM ruby:3.1.2

RUN apt-get update
RUN apt-get -y install postgresql nodejs

WORKDIR /web
COPY . /web

ENTRYPOINT [ "./docker-entrypoint.sh" ]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    BUNDLE_JOBS=2 \
    GEM_HOME=/bundle \
    BUNDLE_GEMFILE=/web/Gemfile
ENV PATH="${BUNDLE_BIN}:${PATH}"

CMD ["bash"]
