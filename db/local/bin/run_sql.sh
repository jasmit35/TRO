#!/bin/bash 

#  Usage: run_sql.sh sql_file [tro] [tro]
sql_file=${1}
user_id=${2}
database=${3}

if [ "${sql_file}" == "" ] ; then
    echo "At least one parameter is required."
    exit 1
fi

if [ "${user_id}" == "" ] ; then
    user_id="tro"
fi

if [ "${database}" == "" ] ; then
    database="tro"
fi

cd /tmp

psql --host localhost --dbname ${database} --username ${user_id} -a -f ${sql_file}  >${sql_file}.log

