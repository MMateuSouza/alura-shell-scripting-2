#!/bin/bash

MEMORY_LIMIT=50
ADMIN_EMAIL=mmds.snf16@uea.edu.br

total_memory=$(free | grep -i mem | awk '{ print $2 }')
consumpted_memory=$(free | grep -i mem | awk '{ print $3 }')
memory_percentage=$(bc <<< "scale=2;$consumpted_memory/$total_memory * 100" | awk -F. '{ print $1 }')

if [ $memory_percentage -gt $MEMORY_LIMIT ]
then
mail -s "Consumo de memória acima do limite" $ADMIN_MAIL<<del
O consumo de memória está acima do limite que foi especificado. Atualmente o consumo é de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi
