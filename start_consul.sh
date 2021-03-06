#!/bin/sh

set -e

run_consul()
{
	exec consul agent -config-file=/opt/rancher/config/server.json -data-dir=/var/consul
}

while [ ! -f "/opt/rancher/config/server.json" ]; do
  echo "Configuration file is not ready yet.. sleeping"
	sleep 1
done

sleep 5
run_consul
