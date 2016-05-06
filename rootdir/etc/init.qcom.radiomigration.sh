#!/system/bin/sh
# Copyright (c) 2016 Cyanogen

migrated=`getprop persist.radio.provmigrated`

if [ "$migrated" != "true" ]; then
   echo "delete from qcril_manual_prov_table;" | /system/xbin/sqlite3 /data/misc/radio/qcril.db
   if [ $? -eq 0 ]; then
      setprop persist.radio.provmigrated true
   fi
fi

