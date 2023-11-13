#!/bin/bash
#Script para SSH

echo "Menu"
echo "1) Configurar SSH por defecto"
echo "0) Salir"
read op

case op in
	1)./defaultssh.sh;;
	0)exit;;
esac

