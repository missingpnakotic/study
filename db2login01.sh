#!/bin/sh

# 設定情報

DB_USER=\''space opera make up'\'
DB_PASS='freelansekiru'
DB_SCHEMA=''
DB_SERVICE='db2c_DB2'
DB_PORT='50000'
DB_NAME='SAMPLE01'
DB_TABLE=''
DB_INSTANCE='db2_01'

# ログ
daylist=`date +"%Y%m%d"`
DBSYSLOG="dbsyslog"${daylist}".log"
SHSYSLOG="shsyslog"${daylist}".log"

# ログ リセット
echo "START DB2" > $DBSYSLOG
echo "START SH" > $SHSYSLOG

case $1 in

	start)
		echo "----------------------------------------" >> $DBSYSLOG
		echo "SESSION START" >> $DBSYSLOG

		#
		db2

		#
		db2 quit

		#
		db2start
		ret=$?

		if [ $ret -eq 0 ]
		then
		echo "DB2 INSTANCE IGNITION SUCCESSFULL"　>> $DBSYSLOG

		else
		echo "DB2 INSTANCE IGNITION FAILED" >> $DBSYSLOG
		exit 1
		fi

		#
		db2 connect to $DB_NAME user $DB_USER using $DB_PASS
		ret=$?

		if [ $ret -eq 0 ]
		then
		echo "DB2 START SUCCESSFULL"　>> $DBSYSLOG

		else
		echo "DB2 START FAILED" >> $DBSYSLOG
		exit 1
		fi
		;;

	stop)
		echo "----------------------------------------" >> $DBSYSLOG
		echo "SESSION START" >> $DBSYSLOG

		#
		db2

		#
		db2 quit

		#
		db2stop
		ret=$?

		if [ $ret -eq 0 ]
		then
		echo "DB2 INSTANCE STOP SUCCESSFULL"　>> $DBSYSLOG

		else
		echo "DB2 INSTANCE STOP FAILED" >> $DBSYSLOG
		exit 1
		fi

		#
		db2 connect reset
		ret=$?

		if [ $ret -eq 0 ]
		then
		echo "DB2 CONNECT RESET SUCCESSFULL"　>> $DBSYSLOG

		else
		echo "DB2 CONNECT RESET FAILED" >> $DBSYSLOG
		exit 1
		fi

		#
		db2 terminate
		ret=$?

		if [ $ret -eq 0 ]
		then
		echo "DB2 TERMINATE SUCCESSFULL"　>> $DBSYSLOG

		else
		echo "DB2 TERMINATE FAILED" >> $DBSYSLOG
		exit 1
		fi

		;;

		*)
		echo "SH&DB2 IOException" >> $DBSYSLOG $SHSYSLOG
		;;

esac

db2 quit &
db2 terminate &

echo "all compleat" >> $DBSYSLOG
echo "all compleat" >> $SHSYSLOG


exit 0
