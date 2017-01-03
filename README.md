## Quick Alpine Baikal Docker Container

[![GitHub Tag](https://img.shields.io/github/tag/tobixen/docker-baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Stars](https://img.shields.io/docker/stars/tobixen/baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tobixen/baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Automated Build](https://img.shields.io/badge/automated-build-green.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker License](https://img.shields.io/badge/license-MIT-green.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)

### Purpose

The primary purpose of this docker image is to test the compatibility between the baikal caldav server and the python caldav client library.  It can probably be used for other test purposes.  Baikal server will come up with a well-known admin password (123) and preconfigured with one user account, testuser with password 123.

This docker image should be runable without root access

### Usage:

```shell
docker run \
    --publish 8080:8080 \
    --volume `pwd`/config:/baikal/Specific
    --name baikal \
    --restart always \
    --detach \
    tobixen/baikal
```

### License

[The MIT License](LICENSE)
