#!/bin/bash
#SUM v1.02 - Innosoft Systematic
#
#Menú inicial para el llamado de los scripts
echo "/**···¡Bienvenido a SUM!···**/"
echo "1) Ingresar usuario"
echo "2) Modificar usuario"
echo "3) Eliminar usuario"
echo "4) Gestionar grupos"
echo "5) Red"
echo "6) Backup"
echo "7) Acerca de"
echo "0) Salir"
read op

function about () {
	echo "/*****************SUM*****************/"
	echo "Versión 1.02 para BASH"
	echo "Gestor de usuarios y grupos de servidores Linux"
	echo "InnoSoft Systematic - HellFire Team"
	echo "Copyright 2023-2023 InnoSoft Systematic"
	echo "/*****************SUM*****************/"
	echo "Presiona cualquier tecla para salir"
	read ap
	case $ap in 
		*)#clear (No funcional, para próxima entrega)
			./SUM.sh
	esac
}

case $op in
	1)./cuser.sh;;
	2)./muser.sh;;
	3)./ruser.sh;;
	4)./groups.sh;;
	5)./red.sh;;
	6)./copy.sh;;
	7)about;;
	0)exit;;
esac


