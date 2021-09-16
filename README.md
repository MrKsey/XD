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


* 2021-06-15 12:59:45: [majestrate/XD, COMMIT] bump version
* 2021-06-15 12:59:23: [majestrate/XD, COMMIT] bullshit change for release
* 2021-06-15 12:59:01: [majestrate/XD, COMMIT] uncomment release line
* 2021-06-15 12:58:37: [majestrate/XD, COMMIT] redo release process
* 2021-06-15 12:58:31: [majestrate/XD, COMMIT] redo makefile
* 2021-06-15 12:09:19: [majestrate/XD, COMMIT] make release script use git version
* 2021-06-15 12:06:29: [majestrate/XD, COMMIT] Update README.md
* 2021-03-23 15:01:16: [majestrate/XD, COMMIT] more
* 2021-03-23 14:34:45: [majestrate/XD, COMMIT] remove from swarm on stop
* 2021-03-23 14:27:10: [majestrate/XD, COMMIT] fixes
