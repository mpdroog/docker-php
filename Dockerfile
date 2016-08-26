FROM alpine:edge
MAINTAINER RootDev <mpdroog@rootdev.nl>

# Environments
ENV TIMEZONE            UTC
#COPY root/ /

# s6 overlay
RUN apk add --no-cache wget \
 && wget https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.3/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
 && tar xvfz /tmp/s6-overlay.tar.gz -C / \
 && rm -f /tmp/s6-overlay.tar.gz \
 && apk del wget

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add --update tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \

    # PHP libs
    && apk add nginx execline ca-certificates \
      php7-fpm php7-mbstring \
      php7-json php7-pdo php7-pdo_mysql \
      php7-mcrypt php7-curl php7-session \

    # Nginx
    && apk add --update nginx \

    # Cleanup
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

# Expose ports
EXPOSE 80 443

ENTRYPOINT ["/init"]
