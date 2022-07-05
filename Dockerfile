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

#keep it from complaining about where it's installed
ENV PATH="/root/.local/bin:$PATH"    
RUN python3 -m pip install --user wheel whoogle-search

FROM alpine:3.15

#python env path taken from the build image and used here as builders aren't needed
COPY --from=base /root/.local /root/.local
ENV PATH="/root/.local/bin:$PATH"

RUN apk add \
    python3 \
    py3-pip

#requests doesn't get copied over from base so I install it here
RUN python3 -m pip install --user requests

COPY startup.sh .
RUN chmod +x ./startup.sh
ENTRYPOINT [ "./startup.sh" ]
