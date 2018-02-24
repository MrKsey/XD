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


































































































































* 2018-02-24 12:38:20: [majestrate/XD, COMMIT] prevent dns rebinding
* 2018-02-24 12:15:42: [majestrate/XD, COMMIT] fix moveto
* 2018-02-24 11:46:59: [majestrate/XD, COMMIT] not standalone technically
* 2018-02-24 11:42:51: [majestrate/XD, COMMIT] add check
* 2018-02-24 11:29:37: [majestrate/XD, COMMIT] check for seeding after move
* 2018-02-24 11:29:02: [majestrate/XD, COMMIT] less logging
* 2018-02-24 11:25:07: [majestrate/XD, COMMIT] add log after check
* 2018-02-24 11:19:53: [majestrate/XD, COMMIT] do deep check on verify all
* 2018-02-24 11:10:20: [majestrate/XD, COMMIT] don't add torrent if verify failed
* 2018-02-24 11:09:18: [majestrate/XD, COMMIT] add local file torrent adding
