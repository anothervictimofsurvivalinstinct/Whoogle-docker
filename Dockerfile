FROM alpine:3.15 AS base

RUN apk add \
    python3 \
    python3-dev \
    py3-pip \
    build-base \
    libxml2-dev \
    libxslt-dev \
    openssl-dev \
    rust \
    cargo \
    libffi-dev

ENV PATH="/root/.local/bin:$PATH"    
RUN python3 -m pip install --user wheel whoogle-search

FROM alpine:3.15

#python env path taken from the build image and used here as builders aren't needed
COPY --from=base /root/.local /root/.local
ENV PATH="/root/.local/bin:$PATH"

RUN apk add \
    python3 \
    py3-pip \
    s6

RUN python3 -m pip install --user requests
  
ENV IP localhost
COPY startup.sh .
RUN chmod +x ./startup.sh
ENTRYPOINT [ "./startup.sh" ]
