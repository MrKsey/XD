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
* 2021-03-23 15:01:16: [majestrate/XD, COMMIT] more
* 2021-03-23 14:34:45: [majestrate/XD, COMMIT] remove from swarm on stop
* 2021-03-23 14:27:10: [majestrate/XD, COMMIT] fixes
* 2021-03-23 14:12:29: [majestrate/XD, COMMIT] fix previous commit
* 2021-03-23 14:08:47: [majestrate/XD, COMMIT] dont accept new peers when we are closed
* 2021-03-23 14:08:39: [majestrate/XD, COMMIT] lokinet stuff
* 2021-03-23 13:29:34: [majestrate/XD, COMMIT] Merge branch 'master' of ssh://github.com/majestrate/XD
* 2021-03-23 13:29:00: [majestrate/XD, COMMIT] fix lokinet outbound connections
* 2021-03-23 12:43:22: [majestrate/XD, COMMIT] update release script
* 2021-03-23 12:43:12: [majestrate/XD, COMMIT] update lokinet tracker url
