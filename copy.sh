#!/bin/bash
#
#Script para seleccion
#
echo "Copia de seguirdad manual"
echo "1) Realizar copia de seguirdad para base de datos"
echo "2) Realizar copia de seguirdad para archivos criticos"
echo "3) Realizar copia de seguirdad completa"
echo "0) Volver"
read op

case $op in
	1)./bd_backup.sh;; #Data Base
	2)./copycf.sh;; #Critic files
	3)./backup.sh;; #Backup completo
	0)./SUM.sh;;
esac

	
