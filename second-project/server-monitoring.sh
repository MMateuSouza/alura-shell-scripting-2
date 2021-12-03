#!/bin/bash

# Requirements: ssmtp, mailutils

http_status=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
ADMIN_EMAIL=mmds.snf16@uea.edu.br

if [ $http_status -ne 200 ]
then
mail -s "Problema no servidor" $ADMIN_EMAIL<<del
Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo web
del
fi
