FROM ubuntu:bionic

ENV DOCKER_CHANNEL=stable \
    DOCKER_VERSION=20.10.7 \
    DEBIAN_FRONTEND=noninteractive

# Install Docker
RUN apt-get update && \
    apt-get -y install \
        bash \
        curl \
        iptables \
        util-linux \
        ca-certificates \
        gcc \
        libc-dev \
        libffi-dev \
        libssl-dev \
        make \
        git \
        wget \
        net-tools \
        iproute2 \
        && \
    curl -fL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" | tar zx && \
    mv /docker/* /bin/ && chmod +x /bin/docker* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache

WORKDIR /shared
COPY docker-entrypoint.sh /bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
