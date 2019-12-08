#!/bin/bash

attackerip="$(cat /var/log/privoxy/logfile | grep -Eoa '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | tail -1)"

if grep -q $attackerip /tmp/ip.txt; then

echo $attackerip is already on the map. What a azzhowl.

exit 0 

else

echo $attackerip >> /tmp/ip.txt

python3 /root/PyGeoIpMap/pygeoipmap.py -i /tmp/ip.txt --service m --db /root/GeoLite2-City_20191203/GeoLite2-City.mmdb -o /var/www/html/

fi

exit 0
