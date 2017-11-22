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
&& echo "[rpc]" > $XD_HOME/torrents.ini \
&& echo "enabled=1" >> $XD_HOME/torrents.ini \
&& echo "bind=$XD_IP:$XD_PORT" >> $XD_HOME/torrents.ini \
&& echo "" >> $XD_HOME/torrents.ini \
&& echo "[log]" >> $XD_HOME/torrents.ini \
&& echo "level=info" >> $XD_HOME/torrents.ini \
&& echo "pprof=0" >> $XD_HOME/torrents.ini \
&& echo "" >> $XD_HOME/torrents.ini \
&& echo "[bittorrent]" >> $XD_HOME/torrents.ini \
&& echo "pex=1" >> $XD_HOME/torrents.ini \
&& echo "dht=0" >> $XD_HOME/torrents.ini \
&& echo "swarms=1" >> $XD_HOME/torrents.ini \
&& echo "tracker-config=$XD_HOME/trackers.ini" >> $XD_HOME/torrents.ini \
&& echo "" >> $XD_HOME/torrents.ini \
&& echo "[gnutella]" >> $XD_HOME/torrents.ini \
&& echo "enabled=0" >> $XD_HOME/torrents.ini \
&& echo "" >> $XD_HOME/torrents.ini \
&& echo "[i2p]" >> $XD_HOME/torrents.ini \
&& echo "address=$I2P_ROUTER" >> $XD_HOME/torrents.ini \
&& echo "" >> $XD_HOME/torrents.ini \
&& echo "[storage]" >> $XD_HOME/torrents.ini \
&& echo "rootdir=$STORAGE" >> $XD_HOME/torrents.ini \
&& echo "metadata=$STORAGE/metadata" >> $XD_HOME/torrents.ini \
&& echo "downloads=$STORAGE/downloads" >> $XD_HOME/torrents.ini \
&& chown -R xd:nobody "$XD_HOME" \
&& chmod -R a+rw "$XD_HOME"

EXPOSE $XD_PORT
VOLUME ["$XD_HOME"]
WORKDIR ["$XD_HOME"]
USER xd

ENTRYPOINT ["XD"]
CMD ["$XD_HOME/torrents.ini"]
