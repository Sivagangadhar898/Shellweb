#!/bin/bash

APP_LOGS_DIR=/home/centos/shellscript-logs

DATE=$(date +%F:%H:%M:%S)
LOGSDIR=/c/devops/repo/shellscript/Shellweb/.git/logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE

while read line
do
    echo "Deleting $line" &>>$LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE