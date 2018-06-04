# Set the base image
FROM alpine
# Dockerfile author / maintainer
MAINTAINER drewgwallace

RUN apk update && \
  apk add gcc automake make git autoconf g++ && \
  git clone https://github.com/tinyproxy/tinyproxy.git
RUN cd tinyproxy && \
  ./autogen.sh && \
  ./configure && \
  sed -i '/docs \\/d' Makefile && \
  make && \
  make install && \
  cd ~ && \
  rm -rf tinyproxy

# Expose default port
EXPOSE 8888

COPY tinyproxy.conf /usr/local/etc/tinyproxy/tinyproxy.conf