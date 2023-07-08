#!/bin/bash
#Matías VILLAGRÁN 3ºBB Nocturno
function menu () {
echo "Menú"
echo "1) Ver grupos primarios (GID)"
echo "2) Ver grupos secundarios de un GID"
echo "3) Cambiar grupo temporal (Grupo efectivo)"
echo "4) Modificar GID y actualizar recursivamente todos los archivos"
echo "5) Modificar nombre del usuario propietario"
echo "6) Añadir un grupo"
echo "7) Eliminar un grupo"
echo "8) Grupos pertenecientes a usuario"
echo "9) Añadir usuario a grupo"
echo "10) Eliminar usuario de grupo"
echo "0) Salir"
}
menu
read op

case $op in
	1) cut -d: -f4 /etc/passwd | sort -u ;;
	# Corta la fila 4 con delimitador ":", se usa el sort para que no repita los resultados iguales.
	2) echo "Escribe GID de grupo"
	read gid
	grep $gid /etc/group | cut -d: -f4 > agroup
	if [ -s "agroup" ]; then #Si el archivo no esta vacío
		echo "Se encontrarion los siguientes subgrupos pertenecientes a $gid: "
		cat agroup
	else
		echo "No se encntraron subgrupos del GID dado"
	fi;;
	3) echo "Escribe grupo a cambiar"
		read tempo
		newgrp $tempo;;
	4) echo "Escribe GID a modificar"
		read gid
	   echo "Escribe nuevo GID"
	   	read gidn
		groupmod -g $gidn -o -R $gid;;
	5) echo "Escribe nombre de grupo"
		read gi
           echo "Esribe nuevo nombre a propietario"
	   	read no
	  	groupmod -n $no $gi;;
	6) echo "Escribe nombre de grupo a crear"
		read ngp
		groupadd $ngp;;
	7) echo "Escribe grupo a eliminar"
		read dgp
		groupdel $dgp;;
	8) echo "Escribe nombre de usuario"
		read usr
		groups $usr;;
	9) echo "Escribe nombre de usuario (si desea agregar mas, separarlos con coma)"
		read usc
		echo "Escribe grupo a añadir"
		read gpp
		usermod -a -G $gpp $usc;;
	10)echo "Escribe nombre de usuario"
		read gdd
		echo "Grupos secundarios en los que pertenece: " 
		id -nG $gdd
		echo "Escribe nombre de grupo"
		read gpo
		usermod -G $gpo $gdd;;
	0)exit

esac