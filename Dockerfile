FROM alpine:3.6

RUN apk update; apk add wget build-base python3 python3-dev jpeg-dev zlib-dev

RUN pip3 install --upgrade pip

RUN pip install Image

WORKDIR /
VOLUME /opt/out

COPY run.sh /run.sh
COPY scrypt.py /scrypt.py

ENTRYPOINT ["/run.sh"]
