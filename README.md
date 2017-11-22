# XD
Unofficial docker image for the XD - I2P BitTorrent Client

Current features:

* i2p only, no chances of cross network contamination, aka no way to leak IP.
* no java required, works with [i2pd](https://github.com/purplei2p/i2pd)

More about XD - https://github.com/majestrate/XD

## Requirements

* server with docker
* i2pd router - https://hub.docker.com/r/ksey/i2pd/

## Usage

* create container from docker image "ksey/XD", set I2P_ROUTER="*your i2pd IP adress*:7656"
* create "downloads" directory on your server for torrent files, connect this directory to the container directory "/home/xd/storage/downloads" and start container. Example:
```
docker pull ksey/XD
docker run --name XD -d -p 1488:1488 -e I2P_ROUTER='[your i2pd IP adress]:7656' -v /server/downloads:/home/xd/storage/downloads ksey/XD
```

After started put torrent files into `/server/downloads/` to start downloading.

To seed torrents put data files into `/server/downloads/` first then add torrent files.

Web UI - http://[your i2pd IP adress]:1488/
