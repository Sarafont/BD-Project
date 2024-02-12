#!/bin/sh

echo  "Seja bem vindo ao sistema de recuperação de dados da CaumPetClinic"
read -p "Qual o seu username: " userName
read -sp "Qual a sua password: " password
echo ""
read -p "Qual o diretório dos backups: " dirName

fileName=$(ls -tp $dirName | grep -v /$ | head -1)

mysql -u $userName -p $password  "CaumPetClinic" < $dirName"/"$fileName
echo "Base de dados recuperada com sucesso"