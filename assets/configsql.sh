#!/bin/bash

set -e
sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/mysql.conf.d/mysqld.cnf && echo "bind-address=0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'vufind_databases';"
mysql -u root -pvufind_databases -e "FLUSH PRIVILEGES;"
mysql -u root -pvufind_databases -e "UPDATE mysql.user SET host='%' WHERE user='root';"

service mysql restart

exec "$@"
