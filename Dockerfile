FROM alpine:latest
LABEL maintainer="sogeuni@gmail.com"

RUN apk update && \
    apk upgrade && \
    apk add bash rtmpdump ffmpeg

RUN mkdir /record

COPY record.sh /record.sh

ENTRYPOINT [ "/record.sh" ]
CMD []