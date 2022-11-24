
apt update
apt install shadowsocks-libev simple-obfs nginx -y
ulimit -n 4096

nano /etc/shadowsocks-libev/config.json

openssl rand -base64 12   

{
    "server": "0.0.0.0",
    "mode":"tcp_and_udp",
    "server_port":443,
    "local_port":1080,
    "password":"yourPassword",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "fast_open":true,
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls;obfs-host=bing.com;failover=127.0.0.1;fast-open"
}

systemctl start shadowsocks-libev-server@config.service


# Client Config

Android Shadowsocks  Client:
https://github.com/shadowsocks/shadowsocks-android/releases/tag/v5.2.6

OBFS Client:
https://github.com/shadowsocks/simple-obfs-android/releases/tag/v0.0.5

iphone client:
https://apps.apple.com/us/app/potatso-lite/id1239860606

Windows Client :
https://github.com/shadowsocks/shadowsocks-windows/releases

OBFS Plugin for windows 
https://github.com/shadowsocks/simple-obfs/releases
