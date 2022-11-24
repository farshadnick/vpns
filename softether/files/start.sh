#!/bin/bash

BASE_DIR="/opt/vpnserver"

# config file check
[ -f $BASE_DIR/vpn_server.config ] || { echo "Config is not a file! Check your docker settings."; exit 1; }

# first start 
if [ -s $BASE_DIR/vpn_server.config ]
then
  echo "Config exists."
else
  echo "Config not exists, creating a basic configuration..."
  $BASE_DIR/vpnserver start
  sleep 2 
  $BASE_DIR/vpnserver stop
  # basic config for remote management
  $BASE_DIR/vpncmd RemoteEnable
fi

# start vpn service
$BASE_DIR/vpnserver start

# something daemon like stuff
[ $( ls -1 $BASE_DIR/server_log/* | wc -l ) -gt 0 ] && { tail -f $BASE_DIR/server_log/*; } || { echo "sorry, log file not found"; tail -f /dev/null; }
