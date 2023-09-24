#!/bin/bash

sed -i "s/\$db_name/$db_name/" /mariadb.sql
sed -i "s/\$db_user/$db_user/" /mariadb.sql
sed -i "s/\$db_password/$db_password/" /mariadb.sql
sed -i "s/\$root_password/$root_password/" /mariadb.sql

service mariadb start && mysql -u root < /mariadb.sql

chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)
 
mysqld