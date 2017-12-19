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

* create container from docker image "ksey/xd", set I2P_ROUTER="*your_i2pd_IP_adress*:7656"
* create "/xd" directory on your server, connect this directory to the container directory "/home/xd" and start container. Example:
```
docker pull ksey/xd
docker run --name XD -d -p 1488:1488 -e I2P_ROUTER='your_i2pd_IP_adress:7656' -v /xd:/home/xd ksey/xd
```

After started put torrent files into `/xd/storage/downloads` to start downloading.

To seed torrents put data files into `/xd/storage/downloads` first then add torrent files.

Web UI - http://XD_IP:1488/














* 2017-12-15 15:15:15: [majestrate/XD, COMMIT] css tweak
* 2017-12-15 15:01:28: [majestrate/XD, COMMIT] update readme
* 2017-12-15 14:58:25: [majestrate/XD, COMMIT] update readme
* 2017-12-15 14:57:21: [majestrate/XD, COMMIT] have go get not require build tags, build webui only when tag specified
* 2017-12-15 14:53:09: [majestrate/XD, COMMIT] bump license date
* 2017-12-15 14:50:59: [majestrate/XD, COMMIT] fix up makefile, don't assume checked out from git
* 2017-12-15 14:46:19: [majestrate/XD, COMMIT] prepare for 0.1.0
* 2017-12-15 13:54:07: [majestrate/XD, COMMIT] fix rates
* 2017-12-15 13:22:20: [majestrate/XD, COMMIT] add ratio tracking
