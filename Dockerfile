#
# Docker image for the I2P BitTorrent Client
# Requred i2pd router (see "ksey/i2pd" docker image)
#
FROM alpine:latest
MAINTAINER Bob <kcey@mail.ru>
ENV REFRESHED_AT 2017–11–22

ENV XD_HOME="/home/xd"
ENV XD_IP="0.0.0.0"
ENV XD_PORT="1488"
ENV I2P_ROUTER="127.0.0.1:7656"
ENV STORAGE="$XD_HOME/storage"

RUN mkdir -p "$STORAGE/downloads" \
&& adduser -S -h "$XD_HOME" xd \
&& chown -R xd:nobody "$XD_HOME" \
&& chmod -R 700 "$XD_HOME" \
&& apk --no-cache add go build-base git yarn \
&& git clone https://github.com/majestrate/XD /tmp/XD \
&& cd /tmp/XD \
&& make \
&& mv /tmp/XD/XD /usr/local/bin/ \
&& ln -s /usr/local/bin/XD /usr/local/bin/XD-CLI \
&& chmod 755 /usr/local/bin/XD* \
&& chown root:root /usr/local/bin/XD* \
&& cd / \
&& rm -rf /tmp/XD && apk --purge del go build-base git yarn \
&& touch $XD_HOME/trackers.ini \
&& cat << EOF > $XD_HOME/torrents.ini \
[rpc]
enabled=1
bind=$XD_IP:$XD_PORT

[log]
level=info
pprof=0

[bittorrent]
pex=1
dht=0
swarms=1
tracker-config=$XD_HOME/trackers.ini

[gnutella]
enabled=0

[i2p]
address=$I2P_ROUTER

[storage]
rootdir=$STORAGE
metadata=$STORAGE/metadata
downloads=$STORAGE/downloads
EOF

EXPOSE $XD_PORT

VOLUME ["$XD_HOME"]

WORKDIR ["$XD_HOME"]

USER xd

ENTRYPOINT ["XD"]

CMD ["$XD_HOME/torrents.ini"]
