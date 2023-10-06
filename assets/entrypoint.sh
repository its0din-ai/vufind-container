#!/bin/bash

set -e

service apache2 start
service ssh start

tail -f /dev/null
