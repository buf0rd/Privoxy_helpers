#!/bin/bash
privoxyLOGfile=/var/log/privoxy/logfile 

####grepped output of above
evil_ip="$(cat $privoxyLOGfile |  grep -e porn | tail -1 | grep -Eoa '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"

if grep -q $evil_ip /etc/privoxy/config; then

echo $evil_ip already incorporated into denied list. 

exit 0

else

sed -i '/223.31.33.71/a\        deny-access     '"$evil_ip"'' /etc/privoxy/config

cat /var/log/privoxy/logfile | grep $evil_ip > /mnt/fayte/logs/porn_$evil_ip.txt

fi

exit 0
