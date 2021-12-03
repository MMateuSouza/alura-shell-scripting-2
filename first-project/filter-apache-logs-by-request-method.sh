#!/bin/bash

cd ~/shell-scripting

if [ -z $1 ]
then
	while [ -z $method ]
	do
		read -p "Você esqueceu de colocar o parâmetro (GET,POST,PUT,DELETE): " method
	done
else
	method=$1
fi

method=$(echo $method | awk '{ print toupper($1) }')

case $method in
	GET)
	cat apache.log | grep GET
	;;
	POST)
        cat apache.log | grep POST
        ;;
	PUT)
        cat apache.log | grep PUT
        ;;
	DELETE)
        cat apache.log | grep DELETE
        ;;
	*)
	echo "O parâmetro informado não é válido"
	;;
esac

