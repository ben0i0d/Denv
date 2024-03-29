FROM debian:trixie

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive \
    CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8 \
    PATH="/opt/conda/bin:${PATH}" \
    HOME="/root" 

# Copy files
COPY cert/cert.pem /usr/local/share/ca-certificates/eoelab.org.crt

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update --yes && apt-get install --yes --no-install-recommends ca-certificates locales bzip2 wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

WORKDIR "${HOME}"