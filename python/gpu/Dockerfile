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
    HOME="/root" \

# Copy files
COPY conf/initial-condarc "${CONDA_DIR}/.condarc"
COPY cert/cert.pem /usr/local/share/ca-certificates/eoelab.org.crt

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update --yes && apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends zsh ca-certificates gnupg2 locales wget curl git git-lfs vim bzip2 zip unzip xclip p7zip-full && \
    update-ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "zh_CN.UTF-8 UTF-8">/etc/locale.gen && locale-gen && \
    mkdir -p "${CONDA_DIR}" && \

WORKDIR /tmp
# install python mamba
RUN wget -qO /tmp/micromamba.tar.bz2 "https://micromamba.snakepit.net/api/micromamba/linux-64/latest" && \
    tar -xvjf /tmp/micromamba.tar.bz2 --strip-components=1 bin/micromamba && rm /tmp/micromamba.tar.bz2 && \
    ./micromamba install --root-prefix="${CONDA_DIR}" --prefix="${CONDA_DIR}" --yes 'mamba' "python=3.12" && \
    rm micromamba && \
    mamba list python | grep '^python ' | tr -s ' ' | cut -d ' ' -f 1,2 >> "${CONDA_DIR}/conda-meta/pinned" && \
    mamba clean --all -f -y && \
    pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple && \
    pip cache purge 

WORKDIR "${HOME}"
