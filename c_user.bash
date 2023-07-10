#!/bin/bash
#Matías VILLAGRÁN 3ºBB Nocturno
#Name SUM v1.01
echo "Creación de usuarios"
echo "1) Crear usuario por defecto"
echo "2) Crear usuario personalizado"
echo "3) Salir"
read op

function nombre () {
	echo "Ingresa nombre de usuario a crear"
	read nombre
	useradd -m -k /home/matias/esqueleto $nombre
	echo "El usuario $nombre ha sido creado correctamente!"
}
function nmenu () {
	echo "Ingresa nombre de usuario a crear"
	read nombre1
	echo "¿Añadir comentario? 1(Si)/2(No)"
	read com
	if [ $com -eq 1 ]; then
		echo "Escriba el comentario"
		read comentario
	else
		echo "Ok"
	fi
	echo "Ingresa numero o nombre de grupo"
	read group

	echo "Ingresa directorio"
	read directorio

	echo "¿La cuenta expira? 1(Si/2(No)"
	read expira
	if [ $expira -eq 1 ]; then
		echo "Ingresa la fecha de expiración en formato YYYY-MM-DD"
		read exp
	else
		echo "Ok"
	fi
	useradd -m -k /home/matias/esqueleto -c $com -g $group -d $directorio -e $expira $nombre1
	echo "Usuario $nombre1 creado existosamente"
	
}


case $op in
	1)nombre;;
	2)nmenu;;
	3)exit;;
esac
