FROM ubuntu:latest
MAINTAINER "Denis Tulyakov" <dtulyakov@gmail.com>
ENV LC_ALL="C.UTF-8" DEBIAN_FRONTEND="noninteractive" GIT="dtulyakov/test-task"

WORKDIR /

RUN set -x \
  && apt-get update -qq \
  && apt-get install -y \
    git \
    tree \
  && apt-get clean \
  && apt-get autoremove -y \
  && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb

ADD entrypoint.sh /
ADD run.sh /

WORKDIR /code
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
