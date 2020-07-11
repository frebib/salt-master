FROM spritsail/alpine:edge

RUN apk --no-cache add \
        salt-master \
        py3-pygit2 \
    && \
    cd "$(python3 -c 'import os, salt; print(os.path.dirname(salt.__path__[0]))')" && \
    wget -O- https://patch-diff.githubusercontent.com/raw/saltstack/salt/pull/57852.patch | patch -p1 && \
    wget -O- https://github.com/frebib/salt/commit/e5d0ab07eea54226d423c0ac0c6fea120c439800.patch | patch -p1 && \
    wget -O- https://github.com/frebib/salt/commit/7fffc9459488044114c2d4285a79c38c1cafcb87.patch | patch -p1 && \
    true

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
