FROM debian:jessie
MAINTAINER Octoblu, Inc. <docker@octoblu.com>
RUN apt-get update && \
  apt-get install -y libpcap0.8 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ADD ptpd2 ptpd2
ENTRYPOINT ["./ptpd2"]
