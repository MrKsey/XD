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
# #
### majestrate/XD last 10 commits:
* 2018-06-09 11:57:02: [majestrate/XD, COMMIT] Merge branch 'master' of ssh://github.com/majestrate/XD
* 2018-06-09 11:56:47: [majestrate/XD, COMMIT] add explicit announce after seeding
* 2018-05-03 22:42:25: [majestrate/XD, COMMIT] don't straddle lots of pieces
* 2018-05-03 22:03:24: [majestrate/XD, COMMIT] more error checking
* 2018-04-29 19:07:01: [majestrate/XD, COMMIT] close
* 2018-04-22 15:42:55: [majestrate/XD, COMMIT] more
* 2018-04-22 15:29:17: [majestrate/XD, COMMIT] fix crash with magnet and multiswarm
* 2018-04-22 15:16:10: [majestrate/XD, COMMIT] fix previous commit
* 2018-04-22 15:15:06: [majestrate/XD, COMMIT] use proper buffering
* 2018-04-22 14:58:45: [majestrate/XD, COMMIT] more buffering attempts
