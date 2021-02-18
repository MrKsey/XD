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

























* 2021-01-31 16:17:10: [majestrate/XD, COMMIT] Merge pull request #89 from komachi/fix-apparmor-profile
* 2021-01-31 16:13:26: [majestrate/XD, COMMIT] fix: fix apparmor profile syntax, allow to create cache dir
# #
### majestrate/XD last 10 commits:
* 2021-01-31 16:17:10: [majestrate/XD, COMMIT] Merge pull request #89 from komachi/fix-apparmor-profile
* 2021-01-31 16:13:26: [majestrate/XD, COMMIT] fix: fix apparmor profile syntax, allow to create cache dir
* 2021-01-27 22:14:03: [majestrate/XD, COMMIT] Merge pull request #88 from komachi/master
* 2021-01-27 21:12:43: [majestrate/XD, COMMIT] feat: provide AppArmor profile, build deb package with AppArmor profile included
* 2021-01-07 11:54:27: [majestrate/XD, COMMIT] Merge pull request #86 from adnan360/progress
* 2021-01-07 11:53:20: [majestrate/XD, COMMIT] Merge pull request #84 from adnan360/magnet-placeholder
* 2021-01-07 06:14:50: [majestrate/XD, COMMIT] Add progress percentage on webui
* 2021-01-07 03:14:30: [majestrate/XD, COMMIT] Change placeholder of torrent-url-input to include magnet url
* 2020-11-02 19:13:54: [majestrate/XD, COMMIT] fix issue #82
* 2020-10-18 10:10:42: [majestrate/XD, COMMIT] Makefile: fix webui target
