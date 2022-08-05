ARG REGISTRY

FROM pypy:3.9-7.3.9-slim-buster

RUN apt-get update && apt-get install -qq  -y --no-install-recommends \
    locales \
    locales-all \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    libxml2-utils \
    bzip2 \
    python2.7 \
    python-pip \
    python-dev \
    libboost-all-dev \
    libtool \
    libffi-dev \
    curl \
    libssl1.1 \
    libssl-dev \
    libz-dev \
    build-essential \
    gdal-bin \
    git

ARG FURY_AUTH
ENV FURY_AUTH=$FURY_AUTH
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN pip install -e .
