#!/bin/bash
#Matías VILLAGRÁN 3ºBB Nocturno
#Name SUM v1.01

function menu () {
echo "Menu de edicion de usuarios"
echo "1) Editar nombre"
echo "2) Bloquear contraseña"
echo "3) Desbloquear contraseña"
echo "4) Establecer contraseña"
echo "5) Agregar a grupo suplementario"
echo "6) Modificar comentario"
echo "7) Cambiar directrio"
echo "8) Modificar fecha de expiración"
echo "9) Cambiar grupo primario"
echo "0) Salir"
}

function ing () {
echo "Ingrese nombre de usuario"
read nom
}

menu
read op


case $op in
	1) ing
		echo "Ingresa nuevo nombre a cambiar"
		read nomb
		usermod -l $nomb $nom
		grep $nomb /etc/passwd
		;;
	2) ing
		usermod -L $nom
		passwd -S $nom
		;;
	3) ing
		usermod -U $nom
		passwd -S $nom
		passwd $nom 
		#`perl -e "print crypt("new-password","Q4")"` $nom
		;;
	4) ing
		passwd $nom
		#`perl -e "print crypt("new-password","Q4")"` $nom
		;;
	5) ing 
		echo "Ingresa grupo a agregar"
		read group
		usermod -a -G $group $nom
		grep $nom /etc/passwd
		;;
	6) ing 
		echo "Ingrese nuevo comentario"
		read com
		usermod -c $com $nom
		grep $nom /etc/passwd
		;;
	7) ing
		echo "Ingrese directorio"
		read directorio
		usermod -d $directorio $nom
		grep $nom /etc/passwd
		;;
	8) ing
		echo "Ingrese fecha de expiración YYYY-MM-DD"
		read fecha
		usermod -e $fecha $nom
		chage -l $nom | grep "La cuenta caduca"
		;;
	9) ing 
		echo "Ingrese grupo"
		read grupo
		usermod -g $grupo $nom
		grep $nom /etc/passwd
		;;
	0) exit;;
esac	
