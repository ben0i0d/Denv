FROM ben0i0d/denv:base

USER root

# Copy files
COPY conf/initial-condarc "${CONDA_DIR}/.condarc"

WORKDIR /tmp
# install python mamba
RUN mkdir -p "${CONDA_DIR}" && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    ./micromamba install --root-prefix="${CONDA_DIR}" --prefix="${CONDA_DIR}" --yes 'mamba' "python=3.12" && \
    rm micromamba && \
    pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple 

WORKDIR "${HOME}"
