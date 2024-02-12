#!/bin/sh

echo "Bem vindo ao script de Schedule de Backup da Base de Dados CaumPetClinic"

if ! [ -x "$(command -v crontab)" ]; then
    echo "Aguarde enquanto instalamos o scheduler..."

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Linux
        sudo apt-get install cron -y
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # MacOS
        sudo brew install cron
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        # Windows
        sudo choco install cron
    fi
fi

read -p "Username de Login na Base de Dados da Clínica: " username
read -p "Password de Login na Base de Dados da Clínica: " password
read -p  "Qual o diretório de destino dos backups: " dirName

if [ ! -d "$dirName" ]; then
  mkdir -p "$dirName"
fi

read -p "Qual o número de backups diários que pretende realizar: " numBackups


read -p "Qual o horario dos backups semanais (HH:MM) : " timestamp

IFS=':'
read -a strarr <<< "$timestamp"


(echo "${strarr[1]} ${strarr[0]} * * *  sh /Users/rkeat/Desktop/Universidade/3ano1semestre/BD-CaumPetClinic/Misc/totalBackup.sh $username $password  /Users/rkeat/Desktop/Universidade/3ano1semestre/BD-CaumPetClinic/Misc/backups" ; crontab -l) | crontab -
echo "Novo backup agendado para todos as semanas às ${strarr[0]}:${strarr[1]}"



for i in $(seq 1 $numBackups); do

    read -p "Qual o horario dos backups (HH:MM) : " timestamp

	IFS=':'
	read -a strarr <<< "$timestamp"

    at $timestamp -f /path/to/script.sh 


	(echo "${strarr[1]} ${strarr[0]} * * *  sh /Users/rkeat/Desktop/Universidade/3ano1semestre/BD-CaumPetClinic/Misc/partialBackup.sh $username $password  /Users/rkeat/Desktop/Universidade/3ano1semestre/BD-CaumPetClinic/Misc/backups" ; crontab -l) | crontab -
	echo "Novo backup agendado para todos os dias às ${strarr[0]}:${strarr[1]}"
done