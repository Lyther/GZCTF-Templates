#!/bin/bash
set -e

sed -i 's/flag{kfccrazythursdayvme50}/'"$GZCTF_FLAG"'/' /root/database.sql

export GZCTF_FLAG=not_flag
GZCTF_FLAG=not_flag

/etc/init.d/mysql start &&\
    mysql -e "grant all privileges on *.* to 'root'@'%' identified by 'toor';"&&\
    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'toor';"&&\
    mysql -u root -ptoor -e "show databases;" &&\
    mysql -u root -ptoor </root/database.sql &&\
	mysql -u root -ptoor -e "show databases;"

sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
	&& echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
	&& mv /tmp/my.cnf /etc/mysql/my.cnf

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid
service mysql start
apache2ctl start
while test "1" = "1"
do
sleep 1000
done
