#! /bin/sh

CNT=0
echo "Input password:"
read TRY
while [ "$TRY" != "123456" ]; do
	echo "Sorry, try again."
	#CNT=$(($CNT+1))
	CNT=$((CNT+1))
	read TRY
done
if [ $CNT != 0 ];then
	echo $CNT "incorrect password attempts!"
fi
