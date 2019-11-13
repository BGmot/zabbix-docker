#!/bin/bash

set -eo pipefail

su mysql -c "/usr/bin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --log-output=none --pid-file=/var/lib/mysql/mysqld.pid --port=3306 --console" &

su zabbix -c "/usr/sbin/zabbix_server --foreground -c /etc/zabbix/zabbix_server.conf" &

su nginx -c "/usr/sbin/nginx "daemon off;" -c /etc/nginx/nginx.conf" &

sleep 5

# If these three processes up then most probably deployment went OK
ps -C mysqld && ps -C zabbix_server && ps -C nginx
