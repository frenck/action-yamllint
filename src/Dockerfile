FROM python:3.13-alpine

COPY requirements.txt /tmp/

RUN \
  apk add --no-cache \
    bash \
  \
  && pip install \
    --no-cache-dir \
    --prefer-binary \
    -r /tmp/requirements.txt

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY entrypoint.sh /entrypoint.sh
COPY matcher.json /matcher.json

ENTRYPOINT ["/entrypoint.sh"]
