#!/bin/bash
set -e

echo  -e "<?php\n  \$flag=\"$GZCTF_FLAG\"\n?>" > /var/www/html/flag.php

export GZCTF_FLAG=not_flag
GZCTF_FLAG=not_flag

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid
apache2ctl start
while test "1" = "1"
do
sleep 1000
done
