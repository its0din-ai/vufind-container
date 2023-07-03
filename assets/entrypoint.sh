#!/bin/bash

set -e

mysqlService() {
  service mysql start
}

mysqlService || {
  echo "Gagal memulai service MySQL, tunggu 3 detik . . ."
  sleep 3
  mysqlService
}

service apache2 start
service ssh start

tail -f /dev/null