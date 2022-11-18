FROM alpine:3.16

ENV OCSERV_VERSION 1.1.2
ENV CA_CN SAMPLE CA
ENV CA_ORG Big Corp
ENV SRV_CN SAMPLE server
ENV SRV_ORG MyCompany
RUN set -ex \
    && apk add --no-cache --virtual .build-dependencies \
    readline-dev \
    libnl3-dev \
    xz \
    openssl \
    make \
    gcc \
    autoconf \
    musl-dev \
    wget \
    linux-headers \
    gnutls-dev \
    linux-pam-dev \
    libseccomp-dev \
    lz4-dev \
    libev-dev \
    protobuf-c-dev \
    krb5-dev \
    gnutls-utils \
    oath-toolkit-dev \
    libmaxminddb-dev \
    && wget ftp://ftp.infradead.org/pub/ocserv/ocserv-$OCSERV_VERSION.tar.xz \
    && mkdir -p /etc/ocserv \
    && tar xf ocserv-$OCSERV_VERSION.tar.xz \
    && rm ocserv-$OCSERV_VERSION.tar.xz \
    && cd ocserv-$OCSERV_VERSION \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf ocserv-$OCSERV_VERSION \
    && mkdir /opt/ocserv/ && mkdir /etc/ocserv/certs && touch /opt/ocserv/ocpasswd \
    && apk add  gnutls linux-pam krb5-libs libtasn1 oath-toolkit-liboath nettle libev protobuf-c musl lz4-libs libseccomp readline libnl3 iptables
WORKDIR /etc/ocserv
COPY entrypoint.sh /entrypoint.sh
EXPOSE 443/tcp
EXPOSE 443/udp
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["ocserv", "-c", "/etc/ocserv/ocserv.conf", "-f"]
