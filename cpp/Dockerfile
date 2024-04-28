FROM ben0i0d/denv:base

USER root

RUN apt-get update --yes && apt-get install --yes --no-install-recommends build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR "${HOME}"