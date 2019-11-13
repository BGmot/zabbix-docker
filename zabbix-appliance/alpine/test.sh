#!/bin/bash

set -eo pipefail

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf &

sleep 10

# If these three processes up then most probably deployment went OK
ps -o comm= | grep mysqld && ps -o comm= | grep zabbix_server && ps -o comm= | grep nginx
