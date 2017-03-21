#!/bin/bash

echo "Welcome to the <b><h2>Buf0rd.com | irc.buf0rd.com/6667 #lounge</h2></b>" > /var/www/html/index.html
echo "Publice awareness proxy dump. The purpose of this public proxy is to provide a <b><font color="red">WAKE UP NOTICE to HTTP & proxy server hoarding users/services</font></b>  <br></br>" >> /var/www/html/index.html

echo "All your data is in the open. Secure your information with  atlest SSL (https) & stop using public proxy services that rely on databases created by sweeping internet for users with lack security !!!<br></br>" >> /var/www/html/index.html

echo "<b></h1>DO NOT EXPECT PRIVACY FROM THIS PROXY. DISCONNECT NOW!</h1></b><br></br><hr>" >> /var/www/html/index.html

echo "<center><h1><a href="http://96.65.123.251/index.html">Enter personal website</a></h1></center><hr>" >> /var/www/html/index.html

echo "<iframe src="rtsp://admin@96.65.123.251/live/ch1"></iframe>" >> /var/www/html/index.html

cat /var/log/privoxy/logfile >> /var/www/html/index.html

rm /var/log/privoxy/logfile

/usr/sbin/service privoxy restart

exit 0
