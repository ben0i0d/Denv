FROM ben0i0d/denv:base

USER root

ENV PATH="/opt/base/bin:${PATH}"

COPY conf/pip.conf /etc/pip.conf

# install python 
RUN apt-get update --yes && apt-get install --yes --no-install-recommends python3-venv && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/base 

WORKDIR "${HOME}"
