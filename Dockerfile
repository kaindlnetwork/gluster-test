FROM lsiobase/ubuntu:jammy

MAINTAINER Fabian Kaindl <gitlab-docker@fabiankaindl.de>

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

#HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

# Dependencies for installing PPA repository and packages
RUN apt-get update && \
    apt-get install -y \
    glusterfs-server \
    wget \
    tzdata && rm -rf /var/lib/apt/lists/*    

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

COPY /root /

#VOLUME $MEDIA_DIR
#EXPOSE 24007-24008
