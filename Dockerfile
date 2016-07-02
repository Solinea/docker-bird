FROM alpine:3.4

MAINTAINER Luke Heidecke <luke@solinea.com>

ARG BIRD_VER=1.5.0-r2

RUN set -ex \
  && export TESTREPO=http://dl-4.alpinelinux.org/alpine/edge/testing \
  && echo "@testing ${TESTREPO}" >> /etc/apk/repositories \
  && apk add --no-cache --update \
        bird@testing=${BIRD_VER}

# standard BGP port
EXPOSE 179

CMD ["/usr/sbin/bird", "-d"]