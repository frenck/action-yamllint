FROM python:3.9-alpine

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

ENTRYPOINT ["/entrypoint.sh"]
