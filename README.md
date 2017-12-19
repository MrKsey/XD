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























# #
### majestrate/XD last 10 commits:
* 2017-12-19 13:40:33: [majestrate/XD, COMMIT] support unix sockets for rpc
