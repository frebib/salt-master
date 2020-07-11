[hub]: https://hub.docker.com/r/frebib/salt-master
[git]: https://github.com/frebib/salt-master
[drone]: https://drone.spritsail.io/frebib/salt-master
[mbdg]: https://microbadger.com/images/frebib/salt-master

# [frebib/salt-master][hub] - A Salt master Docker image
[![Layers](https://images.microbadger.com/badges/image/frebib/salt-master.svg)][mbdg]
[![Git Commit](https://images.microbadger.com/badges/commit/frebib/salt-master.svg)][git]
[![Build Status](https://drone.spritsail.io/api/badges/frebib/salt-master/status.svg)][drone]

Based on alpine:edge, this image contains the latest Salt master, plus a few patches of my own.

## Quick start

```sh
docker run -d \
    -v $PWD/salt:/config \
    -v $PWD/logs:/logs \
    frebib/salt-master
```

## Configuration
Below are the configurable options, mirroring those described in Salt `--help` output. The outputs mirror the salt-master defaults mostly, with the exception of some changed paths to aid in container directory management a little.
|Environment Variable|Default Value|
|---|---|
|`CONFIG_DIR`|`/config`|
|`PID_FILE`|`/dev/null`|
|`LOG_LEVEL`|`info`|
|`LOG_FILE`|`/logs/master`|
|`LOG_FILE_LEVEL`|`info`|
