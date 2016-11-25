#! /bin/bash
# Tested in Open vSwitch 2.6.0 on Ubuntu 14.04

lsmod | grep -i 'openvswitch'
# add openvswitch module to the Linux Kernel
if test $? == 1;then
	modprobe openvswitch
fi

# Initialize the configuration database using ovsdb-tool
if test -e /usr/local/etc/openvswitch/conf.db;then
	echo 'Configuration database was initialized.'
else
	mkdir -p /usr/local/etc/openvswitch
	ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
fi

ps -ea | grep 'ovsdb-server'
# start configuration database, ovsdb-server
if test $? == 1;then
	ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                     --private-key=db:Open_vSwitch,SSL,private_key \
                     --certificate=db:Open_vSwitch,SSL,certificate \
                     --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                     --pidfile --detach
else
	echo 'ovsdb-server is running!'
fi

sleep 1

ps -ea | grep 'ovs-vswitchd'
# start the main Open vSwitch daemon
if test $? == 1;then
	ovs-vsctl --no-wait init
	ovs-vswitchd --pidfile --detach --log-file
else
	echo 'ovs-vswitchd is running!'
fi

