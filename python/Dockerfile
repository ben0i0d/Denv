FROM ben0i0d/denv:base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Copy files
COPY conf/initial-condarc "${CONDA_DIR}/.condarc"

WORKDIR /tmp
# install python mamba
RUN mkdir -p "${CONDA_DIR}" && \
    wget -qO /tmp/micromamba.tar.bz2 "https://micromamba.snakepit.net/api/micromamba/linux-64/latest" && \
    tar -xvjf /tmp/micromamba.tar.bz2 --strip-components=1 bin/micromamba && rm /tmp/micromamba.tar.bz2 && \
    ./micromamba install --root-prefix="${CONDA_DIR}" --prefix="${CONDA_DIR}" --yes 'mamba' "python=3.12" && \
    rm micromamba && \
    mamba list python | grep '^python ' | tr -s ' ' | cut -d ' ' -f 1,2 >> "${CONDA_DIR}/conda-meta/pinned" && \
    mamba clean --all -f -y && \
    pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple && \
    pip cache purge 

WORKDIR "${HOME}"
