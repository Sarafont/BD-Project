#!/bin/sh

if [ ! -d "./logs" ]; then
  mkdir -p "./logs"
fi

echo "Total Backup for CaumPetClinic executed @$(date +\%Y\%m\%d_\%H\%M)" >> "./logs/logs.txt"

database="CaumPetClinic"
filename="$3/TOTALDUMP_$database-$(date +\%Y\%m\%d_\%H\%M).sql"


read -p "Executing this file will delete all files in the directory: $3 and it will make a total dump of the CaumPetClinicDatabase[y/n]" resp
if [ $resp=="y" ]; then
  rm $3/*
  mysqldump --user=$1 --password=$2 --host="localhost" $database > $filename
  echo "Successful backup at $(date +%Y%m%d_%H:%M) "
else
  echo "Operação Abortada"
fi