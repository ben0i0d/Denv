FROM debian:trixie-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive \
    SHELL=/bin/bash \
    HOME="/root" 

# Copy files
COPY cert/cert.pem /usr/local/share/ca-certificates/eoelab.org.crt

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources 

WORKDIR "${HOME}"