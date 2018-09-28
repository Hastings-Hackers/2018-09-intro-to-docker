FROM alpine:3.6

ENV FAKES3_VERSION=2.0.0
ENV FAKES3_LICENSE=DUMMY_LICENSE
ENV FAKES3_HOST=s3.lvh.me

WORKDIR /fakes3_data

EXPOSE 8000
CMD ["fakes3", "server", "--root", ".", "--port", "8000", "--hostname", "$FAKES3_HOST", "--license", "$FAKES3_LICENSE"]

RUN apk add --no-cache ruby ruby-io-console
RUN gem install fakes3 -v $FAKES3_VERSION --no-doc

RUN mkdir -p /fakes3_data && chown nobody:nobody /fakes3_data && chmod 0750 /fakes3_data

USER nobody

VOLUME /fakes3_data
