#!/bin/bash

set -eo pipefail

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf &

sleep 10

# If these three processes up then most probably deployment went OK
ps -C mysqld && ps -C zabbix_server && ps -C nginx
