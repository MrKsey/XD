# XD
Unofficial docker image for the XD - I2P BitTorrent Client

Current features:

* i2p only, no chances of cross network contamination, aka no way to leak IP.
* no java required, works with [i2pd router](https://github.com/purplei2p/i2pd)

More about XD - https://github.com/majestrate/XD

## Requirements

* host with docker
* i2pd router. For example - https://hub.docker.com/r/ksey/i2pd/

## Usage

* create "/xd" directory (for example) on your host.
* set environment variable HOST_USER: HOST_USER=*username*.
  - *username* - host user, must exist and have read/write permissions on the "/xd" directory.
* create container from docker image "ksey/xd", set I2P_ROUTER="*i2pd_IP_adress*:7656", connect host "/xd" directory to the container directory "/home/xd" and start container.

Example:
```
HOST_USER=<username>
docker pull ksey/xd
docker run --name XD -d -p 1488:1488 \
-e HOST_USER_ID=$(id -u $HOST_USER) \
-e HOST_GROUP_ID=$(id -g $HOST_USER) \
-e I2P_ROUTER=<i2pd_IP_adress>:7656 \
-v /xd:/home/xd ksey/xd

```
<i2pd_IP_adress> - IP address of the i2pd router MAST be changed to actual IP!!!

After started put torrent files into `/xd/storage/downloads` to start downloading.

To seed torrents put data files into `/xd/storage/downloads` first then add torrent files.

Web UI can be accessed at http://*host_ip*:1488/













































































































































### majestrate/XD last 10 commits:
* 2018-02-24 18:12:56: [majestrate/XD, COMMIT] oversized metainfo fix
* 2018-02-24 18:04:19: [majestrate/XD, COMMIT] magnets are now partially supported
* 2018-02-24 17:45:51: [majestrate/XD, COMMIT] allocate files after getting info
* 2018-02-24 17:40:20: [majestrate/XD, COMMIT] off by one?
* 2018-02-24 17:38:35: [majestrate/XD, COMMIT] check for ready when putting slice
* 2018-02-24 17:32:47: [majestrate/XD, COMMIT] more
* 2018-02-24 17:29:31: [majestrate/XD, COMMIT] more
* 2018-02-24 17:17:11: [majestrate/XD, COMMIT] more
* 2018-02-24 17:07:30: [majestrate/XD, COMMIT] more
* 2018-02-24 16:41:11: [majestrate/XD, COMMIT] more
