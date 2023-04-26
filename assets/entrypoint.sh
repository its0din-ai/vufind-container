#!/bin/bash

set -e
service mysql start

sh -c "configsql.sh"

exec "$@"
