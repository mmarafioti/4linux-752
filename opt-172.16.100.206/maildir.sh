#!/bin/bash

for NOME in $(getent passwd | awk -F:  '$3 >=1000 { print $1 }' | egrep -v "nobody|vagrant|suporte")
do
	echo $NOME Criado diretório
	maildirmake /home/${NOME}/Maildir
	maildirmake /home/${NOME}/.Enviados
	maildirmake /home/${NOME}/.Rascunhos
	maildirmake /home/${NOME}/.Lixeira
	maildirmake /home/${NOME}/.SPAM
	
	echo $NOME alterado dono
	chown ${NOME}: /home/${NOME} -R

done

