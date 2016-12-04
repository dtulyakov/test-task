FROM ubuntu:14.04
MAINTAINER "Denis Tulyakov" <dtulyakov@gmail.com>
ENV LC_ALL="C.UTF-8" DEBIAN_FRONTEND="noninteractive"
ENV JAVA_OPTS -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8

WORKDIR /

RUN set -x \
  && apt-get update -qq \
  && apt-get install -y \
    puppetmaster \
    apt-utils \
    lsof \
    openjdk-6-jre-headless \
  && apt-get clean \
  && apt-get autoremove -y

RUN set -x \
  && apt-get install -y \
    tomcat6 \
    tomcat6-user \
    nginx \
  && rm /etc/nginx/sites-enabled/default
ADD nginx2tomcat.conf /etc/nginx/sites-enabled/
ADD entrypoint.sh /
ADD run.sh /
ADD puppet.pp /

RUN set -x \
  && apt-get remove -y \
    nginx \
    tomcat6

EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
