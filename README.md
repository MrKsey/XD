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

* get host user UID: id -u *username*
* get host user group GID: id -g *username*
* create container from docker image "ksey/xd", set HOST_USER_ID=*UID*, HOST_GROUP_ID=*GID*, I2P_ROUTER="*your_i2pd_IP_adress*:7656".
  HOST_USER_ID / HOST_GROUP_ID - user id / group id of user/group that have read/write permissions on host directory.
  IP address of the i2pd router MAST be changed to actual IP!!!
* create "/xd" directory on your server, connect this directory to the container directory "/home/xd" and start container.
  Example:
```
docker pull ksey/xd
docker run --name XD -d -p 1488:1488 -e HOST_USER_ID=*UID* -e HOST_GROUP_ID=*GID* -e I2P_ROUTER='your_i2pd_IP_adress:7656' -v /xd:/home/xd ksey/xd
```

After started put torrent files into `/xd/storage/downloads` to start downloading.

To seed torrents put data files into `/xd/storage/downloads` first then add torrent files.

Web UI - http://XD_IP:1488/

# #
### majestrate/XD last 10 commits:
* 2017-12-24 22:09:01: [majestrate/XD, COMMIT] more
* 2017-12-24 21:53:18: [majestrate/XD, COMMIT] more
* 2017-12-24 20:44:55: [majestrate/XD, COMMIT] more
* 2017-12-24 19:51:24: [majestrate/XD, COMMIT] more
