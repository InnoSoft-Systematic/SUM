#!/bin/bash
#

while :
do
 echo "Menu de registros"
 echo "1) Ver usuarios conectados"
 echo "2) Ver ultimo arranque del sistema"
 echo "3) Ver actividad de usuarios"
 echo "4) Conexiones realizadas" 
 echo "5) Intentos de conexion fallidos"
 echo "0) Salir"
 read op

case $op in
        1)who;;
        2)who -b;;
        3)w;;
        4)last;;
        5)sudo lastb;;
        0)exit;;
	*)echo "Opcion incorrecta";;
esac
done
