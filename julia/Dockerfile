FROM ben0i0d/denv:python AS builder

# install Julia packages in /opt/julias
RUN apt-get update --yes && apt-get install --yes --no-install-recommends gnupg && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip --no-cache-dir install jill && jill install --confirm 

FROM ben0i0d/denv:base 

COPY --from=builder /opt/julias/ /opt/julias/

ENV JULIA_PKG_SERVER=https://mirrors.ustc.edu.cn/julia \
    JULIA_NUM_THREADS=12

RUN ln -s "`find /opt/julias -name 'bin'`/julia" /usr/local/bin/julia 