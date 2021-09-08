#!/bin/bash
set -e

TABLES="person"

for TABLE in $TABLES
do
    if [ ! -f /tables/$TABLE.imported ]; then
        psql -v ON_ERROR_STOP=1 -U diva diva < /tables/$TABLE.sql > /tables/$TABLE.log
        touch /tables/$TABLE.imported
    fi
done

DATA="authority-person"

for DATA in $DATA
do
    if [ ! -f /data/$DATA.imported ]; then
        psql -v ON_ERROR_STOP=1 -U diva diva < /data/$DATA.sql > /data/$DATA.log
        touch /data/$DATA.imported
    fi
done