#!/bin/bash
#
#SUM v1.0.2
#Ver los parámteros, userdel -r es frágil

echo "1) Eliminar usuario"
echo "2) Eliminar usuario y su directorio"
echo "3) Volver"
read op

case $op in
	1)echo "Ingresa nombre del usuario a eliminar"
	read remove

	if grep -i -w $remove /etc/passwd; then
		userdel $remove
		echo "El usuario $remove se ha eliminado exitosamente"
	else 
		echo "El usuario ingresado no existe"
	fi	;;
	2)echo "Ingresa nombre del usuario a eliminar"
	#Sintaxis igual al de arriba, solo cambia la opción en el comando, el "-r" elimina el directorio personal del usuario
	read remove1
	if grep -i -w $remove1 /etc/passwd; then
                userdel -r $remove1
                echo "El usuario $remove1 y su directorio personal se ha eliminado exitosamente"
        else
                echo "El usuario ingresado no existe"
        fi      ;;
	3)./SUM.sh;;
esac
