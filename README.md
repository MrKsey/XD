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



* 2019-05-27 13:17:31: [majestrate/XD, COMMIT] Merge branch 'master' of ssh://github.com/majestrate/XD
* 2019-05-27 13:17:19: [majestrate/XD, COMMIT] update readme
* 2019-04-07 15:27:16: [majestrate/XD, COMMIT] Merge pull request #73 from eyedeekay/master
* 2019-04-07 13:25:39: [majestrate/XD, COMMIT] don't use sudo in postinst
* 2019-04-07 03:46:27: [majestrate/XD, COMMIT] it doesn't need to chown at all anymore
* 2019-04-07 03:46:27: [majestrate/XD, COMMIT] fix the initscript and resolve a lintian complaint
* 2019-03-02 13:57:07: [majestrate/XD, COMMIT] make it compile
* 2019-03-02 13:56:35: [majestrate/XD, COMMIT] fix regression and add unit test to check for it
* 2019-03-02 13:19:35: [majestrate/XD, COMMIT] start adding unit tests
* 2019-02-24 13:29:42: [majestrate/XD, COMMIT] update piece selection to be less fragmented
