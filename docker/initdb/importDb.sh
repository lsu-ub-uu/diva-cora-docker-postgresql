#!/bin/bash
set -e

echo "Creating tables"
TABLE_DIR="sql/tables"

for TABLE in "$TABLE_DIR"/*
do
  echo "$TABLE"
  psql -v ON_ERROR_STOP=1 -U diva diva < $TABLE > $TABLE.log
done

echo "Loading data"
DATA_DIR="/sql/data"

for DATA in "$DATA_DIR"/*
do
  echo "$DATA"
  psql -v ON_ERROR_STOP=1 -U diva diva < $DATA > $DATA.log
done





