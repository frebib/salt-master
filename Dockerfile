FROM spritsail/alpine:edge

ARG SALT_VERSION=3002.2-r0

LABEL maintainer="frebib <salt-master@frebib.net>" \
      org.label-schema.vendor="frebib" \
      org.label-schema.name="SaltStack Salt Master" \
      org.label-schema.url="https://github.com/saltstack/salt" \
      org.label-schema.description="Software to automate the management and configuration of any infrastructure or application at scale." \
      org.label-schema.version=${SALT_VERSION} \
      io.spritsail.version.salt=${SALT_VERSION}

ADD patches/ /tmp/patches

RUN apk --no-cache add \
        salt-master=${SALT_VERSION} \
    && \
    cd "$(python3 -c 'import os, salt; print(os.path.dirname(salt.__path__[0]))')" && \
    for file in /tmp/patches/*.patch; do \
        patch -p1 < "$file"; \
    done

ENV CONFIG_DIR=/config \
    PID_FILE=/dev/null \
    LOG_LEVEL=info \
    LOG_FILE=/logs/master \
    LOG_FILE_LEVEL=info

CMD salt-master --version && \
    exec salt-master \
        --config-dir=$CONFIG_DIR \
        --pid-file=$PID_FILE \
        --log-level=$LOG_LEVEL \
        --log-file=$LOG_FILE \
        --log-file-level=$LOG_FILE_LEVEL
