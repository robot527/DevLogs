#! /bin/bash
# Tested in Open vSwitch 2.6.0 on Ubuntu 14.04

pgrep 'ovsdb-server'
if test $? == 0;then
	ovs-appctl -t ovsdb-server exit
fi

pgrep 'ovs-vswitchd'
if test $? == 0;then
	ovs-appctl -t ovs-vswitchd exit
fi

ps -ea | grep 'ovs'

