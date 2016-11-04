#! /bin/sh

# automatically telnet operations for device test.

(echo username;
sleep 1;
echo passwd;
#sleep 1;
echo "show version";
sleep 1;
echo exit)|telnet 127.1 23
