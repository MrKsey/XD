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


* 2022-03-15 16:14:46: [majestrate/XD, COMMIT] Merge pull request #97 from acetoneRu/master
* 2022-03-15 15:49:08: [majestrate/XD, COMMIT] I2CP parameters
* 2021-12-19 14:02:00: [majestrate/XD, COMMIT] Merge pull request #96 from r4sas/trackers
* 2021-12-19 08:16:08: [majestrate/XD, COMMIT] announce uploaded size (counted for session, not since torrent was added)
* 2021-12-19 08:09:02: [majestrate/XD, COMMIT] add extension to built with make windows binary
* 2021-12-19 04:25:32: [majestrate/XD, COMMIT] add r4sas opentracker, reorder list (skank and thebland is less stable)
* 2021-12-19 03:57:48: [majestrate/XD, COMMIT] correct url
* 2021-12-19 03:18:26: [majestrate/XD, COMMIT] go fmt
* 2021-12-19 03:17:56: [majestrate/XD, COMMIT] update opentracker defualt list for i2p
* 2021-12-18 15:54:37: [majestrate/XD, COMMIT] fix up release script notes generation formatting
