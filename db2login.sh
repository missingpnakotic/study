#!/bin/sh

# The user management user instance common user

DB_USER='db2admin'
DB_PASS='**********'
DB_SCHEMA=''
DB_SERVICE='db2c_DB2'
DB_PORT='50000'
DB_NAME='SAMPLE2'
DB_TABLE=''
DB_INSTANCE='db2_01'


case $1 in

	start)
		echo 'Connection start'

			# start
			db2

			# I exit the interactive mode
			db2 quit

			# Instance startup
			db2start

			db2 connect to $DB_NAME user $DB_USER using $DB_PASS;
			# db2 set current schema $DB_SCHEMA_BKE;

	;;

	stop)
		echo 'Disconnection'

			# Stopping an Instance
			db2stop

			# I will cut the DB to which you are connected.
			db2 disconnect

			# The only disconnects
			db2 connect reset

			# I will terminate the background connection process itself CLP
			db2 terminate

	;;

	*)
		echo "Abnormal processing system"
		;;

esac
