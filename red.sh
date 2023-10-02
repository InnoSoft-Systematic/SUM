#!/bin/bash
#
echo "Menú conexiones"
echo "1) Mostrar las redes actuales"
echo "2) Habilitar una red"
echo "3) Deshabilitar una red"
echo "0) Volver"
read op

case $op in
	1)echo "Conexiones existentes"
		nmcli connection show
		./red.sh
		;;
	2)echo "Ingrese nombre de la conexión a HABILITAR"
		read red
		nmcli connection up "$red"
		echo "$red HABILITADA"
		./red.sh
		;;
	3)echo "Ingrese nombre de la conexión a DESHABILITAR"
		read red
		nmcli connection down "$red"
		echo "$red DESHABILITADA"
		./red.sh
		;;
	0)./SUM.sh
		;;
esac


