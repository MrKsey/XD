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


* 2017-12-05 13:54:43: [majestrate/XD, COMMIT] piece tracker: maxPending 8, 30s timeout
* 2017-11-22 11:40:28: [majestrate/XD, COMMIT] update russian documentation, thanks webofdark.com
* 2017-11-20 13:28:08: [majestrate/XD, COMMIT] update readme
* 2017-11-20 13:24:44: [majestrate/XD, COMMIT] * add gnutella protocol stubs
* 2017-11-18 19:19:50: [majestrate/XD, COMMIT] Merge pull request #40 from sexybiggetje/dark-webui
* 2017-11-18 19:13:31: [majestrate/XD, COMMIT] Fluid container, Dark UI, margins, logo addition
* 2017-11-13 13:58:34: [majestrate/XD, COMMIT] add CoC(k)
* 2017-11-02 17:00:01: [majestrate/XD, COMMIT] Merge pull request #39 from l-n-s/webui
* 2017-11-02 15:42:11: [majestrate/XD, COMMIT] better style of del button
* 2017-11-02 15:35:04: [majestrate/XD, COMMIT] clean yarn and webpack stuff
