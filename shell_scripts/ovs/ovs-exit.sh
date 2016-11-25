#! /bin/bash
# Tested in Open vSwitch 2.6.0 on Ubuntu 14.04

ovs-appctl -t ovsdb-server exit
ovs-appctl -t ovs-vswitchd exit

ps -ea | grep 'ovs'

