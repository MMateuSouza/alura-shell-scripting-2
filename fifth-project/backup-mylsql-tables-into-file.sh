#!/bin/bash

BACKUP_PATH=$HOME/backup
if [ ! -d $BACKUP_PATH ]
then
	mkdir BACKUP_PATH
fi

cd $BACKUP_PATH
date=$(date +%F)
if [ ! -d $date ]
then
	mkdir $date
fi

tables=$(mysql -u root multillidae -e "show tables;" | grep -v Tables)

for table in $tables
do
	mysqldump -u root multillidae $table > $BACKUP_PATH/$date/$table.sql
done
