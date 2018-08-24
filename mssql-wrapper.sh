#!/bin/bash
#
# Wrapper for dbext MSSQL profiles
#

# osql/tsql in freetds don't seem to accept a file flag; replace -d option with -D for database name
options="$( echo "$@" | sed 's/ -i.*//;s/-d/-D/' )"
# supress header
options="${options} -o q"
sql_scratch="$( echo "$@" | sed 's/^.* -i //' )"
cat "$sql_scratch" | tsql $options | column -t -s $'\t' -o ' | '
