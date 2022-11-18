#!/bin/sh
set -e
iptables -t nat -A POSTROUTING -j MASQUERADE
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl -p
if [ ! -f /etc/ocserv/certs/server-key.pem ] || [ ! -f /etc/ocserv/certs/server-cert.pem ]; then

                CA_CN="VPN CA"
                CA_ORG="Big Corp"
                CA_DAYS=9999
                SRV_CN="www.example.com"
                SRV_ORG="MyCompany"
                SRV_DAYS=9999

        # No certification found, generate one
        mkdir /etc/ocserv/certs
        cd /etc/ocserv/certs
        certtool --generate-privkey --outfile ca-key.pem
        cat > ca.tmpl <<-EOCA
        cn = "$CA_CN"
        organization = "$CA_ORG"
        serial = 1
        expiration_days = $CA_DAYS
        ca
        signing_key
        cert_signing_key
        crl_signing_key
        EOCA
        certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca.pem
        certtool --generate-privkey --outfile server-key.pem
        cat > server.tmpl <<-EOSRV
        cn = "$SRV_CN"
        organization = "$SRV_ORG"
        expiration_days = $SRV_DAYS
        signing_key
        encryption_key
        tls_www_server
        EOSRV
        certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
fi
exec "$@"
