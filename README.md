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





























* 2019-03-02 13:57:07: [majestrate/XD, COMMIT] make it compile
* 2019-03-02 13:56:35: [majestrate/XD, COMMIT] fix regression and add unit test to check for it
* 2019-03-02 13:19:35: [majestrate/XD, COMMIT] start adding unit tests
# #
### majestrate/XD last 10 commits:
* 2019-03-02 13:57:07: [majestrate/XD, COMMIT] make it compile
* 2019-03-02 13:56:35: [majestrate/XD, COMMIT] fix regression and add unit test to check for it
* 2019-03-02 13:19:35: [majestrate/XD, COMMIT] start adding unit tests
* 2019-02-24 13:29:42: [majestrate/XD, COMMIT] update piece selection to be less fragmented
* 2019-02-23 23:31:59: [majestrate/XD, COMMIT] always use compact tracker announces for i2p
* 2019-02-12 01:31:18: [majestrate/XD, COMMIT] Merge branch 'fix-d-torrents' of eccentric/XD into master
* 2019-02-12 00:56:00: [majestrate/XD, COMMIT] add integer into rpc TN
* 2019-02-10 21:16:49: [majestrate/XD, COMMIT] Merge branch 'obscure-version' of eccentric/XD into master
* 2019-02-09 03:55:16: [majestrate/XD, COMMIT] constant to use git version if available (true by default)
* 2019-01-26 17:19:49: [majestrate/XD, COMMIT] try fixing 69
