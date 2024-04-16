FROM ben0i0d/denv:python AS builder

COPY quarto-1.4.553-linux-amd64.deb .

RUN dpkg -i quarto-1.4.553-linux-amd64.deb && rm quarto-1.4.553-linux-amd64.deb

FROM ben0i0d/denv:python

ENV PATH="${PATH}:/opt/quarto/bin" 

COPY --from=builder /opt/quarto/  /opt/quarto/

RUN pip install matplotlib plotly && \
    pip cache purge 