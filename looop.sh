#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILES=$LOGSDIR/$0-$DATE.log



USERID=$(id -u)

if [ $USERID -ne 0 ];
then
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "Installing $2....FAILURE"
        exit 1
        
        else
        echo "Installing $2....SUCCESS"
    fi
}


for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is no installed, let's install it"

        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo "$i is already installed"
    fi            
done