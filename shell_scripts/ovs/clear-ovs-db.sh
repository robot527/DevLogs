#! /bin/bash
# Tested in Open vSwitch 2.6.0 on Ubuntu 14.04

pgrep 'ovsdb-server'
if test $? == 1;then
	rm /usr/local/etc/openvswitch/conf.db
	ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
	ls -l /usr/local/etc/openvswitch/conf.db
else
	echo 'You should stop the Open vSwitch daemons (ovsdb-server, ovs-vswitchd) before exec this script!'
fi

