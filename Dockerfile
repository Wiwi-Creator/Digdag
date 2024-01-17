FROM ubuntu:20.04 AS builder

ENV LANG="C.UTF-8"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common curl git libpq-dev libssl-dev python3.8-dev build-essential;

ENV PYTHONIOENCODING=utf-8 \
    CLOUDSDK_PYTHON=/usr/bin/python3

COPY etc /app/etc

ENV PIPENV_VENV_IN_PROJECT=1

COPY pipenv/ /opt/pipenv

RUN add-apt-repository ppa:deadsnakes/ppa; \
    apt-get update && apt-get install -y --no-install-recommends python3.8 python3-pip; \
    python3.8 -m pip install pipenv==2023.07.23;\
    for env in /opt/pipenv/*; do export PIPENV_PIPFILE=${env}/Pipfile && pipenv install --skip-lock; done;

# install dev-base packages
ENV PYTHONIOENCODING=utf-8 \
    PACKAGES="\
    xz-utils \
    libtool \
    libyaml-dev \
    openssh-client \
    jq \
    curl \
    apt-transport-https \
    openjdk-8-jre-headless=8u252-b09-1ubuntu1 \
    software-properties-common \
    gpg-agent \
    build-essential \
    awscli \
    tzdata \
    libpq-dev \
"

RUN apt-get update && apt-get install -y --no-install-recommends ${PACKAGES}; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone; \
    dpkg-reconfigure --frontend noninteractive tzdata; \
    add-apt-repository ppa:deadsnakes/ppa; \
    apt-get update && apt-get install -y --no-install-recommends python3.8 python3-pip; \
    python3.8 -m pip install pipenv; \
    ssh-keygen -q -N '' -f ~/.ssh/google_compute_engine -t rsa; \
    rm -rf /var/lib/apt/lists/* && apt-get clean all;

# install digdag & embulk
ENV DIGDAG_DOWNLOAD_SERVER='https://dl.Digdag.io' \
    DIGDAG_VERSION='0.9.43' 

RUN curl -o /usr/bin/digdag --create-dirs -L "$DIGDAG_DOWNLOAD_SERVER/digdag-$DIGDAG_VERSION"; \
    chmod a+x /usr/bin/digdag; 

# set digdag environment variable
ENV PATH="$PATH:/opt/mssql-tools/bin" \
    OPENSSL_CONF='/app/etc/openssl.cnf'

EXPOSE 65432 65433

CMD digdag server \
    --max-task-threads 4 \
    --disable-scheduler \
    -p DIGDAG_USER=${DIGDAG_USER} \
    -p DIGDAG_PASSWORD=${DIGDAG_PASSWORD} \
    --config /app/etc/digdag.properties
