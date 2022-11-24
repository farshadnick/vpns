# SoftEther

My basic SoftEther VPN Server container.

  - https://www.softether.org

# Usage

The recommended way is docker-compose (with normal network mode).

VERY IMPORTANT!: Create an empty config file with world-wide write permission under the config folder before start the server:
```
mkdir config
touch config/vpn_server.config
chmod 777 config/vpn_server.config
```

Start the container:

```
docker-compose up -d
```

# Remote Management

  - start the VPN server
  - connect to the server with SoftEther Server Manager Tool from Windows or macOS

Notice:
sometimes the default 443 port is used by another service, so use another available port like 5555, 8888...

## Configuration

You can manage the VPN server from Windows with the Server Manager tool. Connect to the VPN server through 5555 TCP port. This is opened by default in docker-compose file.

Do not worry. Any opened port accept every type of connection ( management, OpenVPN, etc). So you can use only one port if you like it.

### OpenVPN

- Download the sample configuration files for OpenVPN clients (too) under the "OpenVPN/MS-SSTP Settings" with "Generate ..." button.
- Use the `...openvpn_remote_access_l3.ovpn` file for clients (road warriors :) )
Do not forget! Change these parameters to your configuration in this sample file:
```
proto tcp
remote vpn9999999999.v4.softether.net 5555
```
Upload the modified file to your clients and use it.



Good Luck!
