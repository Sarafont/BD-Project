#!/bin/sh

if [ ! -d "./logs" ]; then
  mkdir -p "./logs"
fi

echo "Partial Backup for CaumPetClinic executed @$(date +\%Y\%m\%d_\%H\%M)" >> "./logs/logs.txt"

database="CaumPetClinic"
filename="$3/PARTIALDUMP_$database-$(date +\%Y\%m\%d_\%H\%M).sql"


mysqldump --user=$1 --password=$2 --host="localhost" $database "Pedido" "Cliente" "Animal" > $filename
echo "mysqldump --user=\"$1\" --password=\"$2\" --host="localhost" $database "Pedido" "Cliente" "Animal" > $filename"
echo "Successful backup at $(date +%Y%m%d_%H:%M) "
