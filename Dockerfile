#
# Docker image for the I2P BitTorrent Client
# Requred i2pd router (see "ksey/i2pd" docker image)
#
FROM alpine:latest
MAINTAINER Bob <kcey@mail.ru>
ENV REFRESHED_AT 2017–11–22

ENV XD_IP="0.0.0.0"
ENV XD_PORT="1488"
ENV I2P_ROUTER="127.0.0.1:7656"

COPY start_xd.sh /start_xd.sh

RUN export XD_HOME="/home/xd" \
&& chmod a+rx /start_xd.sh \
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
&& mkdir -p "$XD_HOME" \
&& adduser -S -h "$XD_HOME" xd \
&& chown -R xd:nogroup "$XD_HOME" \
&& chmod -R a+rw "$XD_HOME"

EXPOSE "$XD_PORT"
VOLUME "$XD_HOME"
WORKDIR "$XD_HOME"
USER xd

ENTRYPOINT ["/start_xd.sh"]
