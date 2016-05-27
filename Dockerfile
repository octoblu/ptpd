FROM buildpack-deps:jessie-curl
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

RUN apt-get update -y && \
  apt-get install -y \
    make \
    autoconf \
    libtool \
    libpcap-dev
WORKDIR /tmp
ADD https://github.com/ptpd/ptpd/archive/ptpd-2.3.1.tar.gz /tmp
RUN tar zxvf ptpd-2.3.1.tar.gz
WORKDIR /tmp/ptpd-ptpd-2.3.1
RUN autoreconf -vi && \
  ./configure --disable-so-timestamping --enable-static --disable-shared && \
  make
WORKDIR /tmp/ptpd-ptpd-2.3.1/src

CMD ["./ptpd2"]
