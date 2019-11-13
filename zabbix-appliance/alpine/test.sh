#!/usr/bin/bash

# Wait for container to provision DB and start all the services
sleep 60

# If these three processes up then most probably deployment went OK
ps -C mysqld && ps -C zabbix_server && ps -C nginx
