#!/bin/sh
# loggy.sh.

_date=`date +%F_%H-%M-%S`
logcat -v time -f  /cache/logcat_${_date}.txt
cat /proc/kmsg > /cache/kmsg_${_date}.txt
