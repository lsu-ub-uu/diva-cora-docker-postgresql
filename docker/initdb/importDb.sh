#!/bin/bash
set -e

function run_sql () {
   for SQL in "$1"/*
	do
 	 echo "Run file: $SQL"
  		psql -v ON_ERROR_STOP=1 -U diva diva < $SQL > $SQL.log
	done
}

echo ""
echo "Creating tables"
run_sql "sql/tables"

echo ""
echo "Loading data"
run_sql "/sql/data"



