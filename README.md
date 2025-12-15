
## Purpose of the fork and archival

The primary purpose of this docker image was to test the compatibility between the baikal caldav server and the python caldav client library.  Baikal server will come up with a well-known admin password (123) and preconfigured with one user account, testuser with password 123.  This docker image should be runable without root access

I forgot about this project for years - and then I later decided to ask Claude to help me set up a docker-based Baikal-server as a part of the test run.  It spent LOTS of time and credits, starting with the ckulka/baikal:nginx image, trying to redo quite some of the work done here - basically, ensuring Baikal would come up ready for use and with a test-user with a well-known username and password.  Check it out on https://github.com/python-caldav/caldav/tree/master/tests/docker-test-servers/baikal

## Quick Alpine Baikal Docker Container

[![GitHub Tag](https://img.shields.io/github/tag/tobixen/docker-baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Stars](https://img.shields.io/docker/stars/tobixen/baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tobixen/baikal.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker Automated Build](https://img.shields.io/badge/automated-build-green.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)
[![Docker License](https://img.shields.io/badge/license-MIT-green.svg)](https://registry.hub.docker.com/u/tobixen/baikal/)

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
