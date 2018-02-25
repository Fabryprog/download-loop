FROM alpine:3.6

RUN apk update; apk add wget

WORKDIR /
VOLUME /opt/out

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
