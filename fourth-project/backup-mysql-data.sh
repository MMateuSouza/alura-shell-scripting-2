#!/bin/bash

cd $HOME
BACKUP_PATH=$HOME/backup

if [ ! -d $BACKUP_PATH ]
then
	mkdir $BACKUP_PATH
fi

mysqldump -u root $1 > $BACKUP_PATH/$1.sql
if [ $? -eq 0 ]
then
	echo "Backup foi realizado com sucesso"
else
	echo "Houve um problema no backup"
fi
