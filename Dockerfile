FROM alpine:latest
LABEL maintainer="sogeuni@gmail.com"

RUN apk update && \
    apk upgrade && \
    apk add bash tzdata rtmpdump ffmpeg

# set timezone (Asia/Seoul)
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN mkdir /recording

COPY record.sh /record.sh

ENTRYPOINT [ "/record.sh" ]
CMD []