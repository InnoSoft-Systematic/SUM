#!/bin/bash
echo "Respaldo Base de datos"
echo "Ingrese nombre de la base"
read base_de_datos
echo "Ingrese nombre de usuario"
read usuario_mysql
echo "Ingrese contraseña"
read contrasena_mysql

# Creo respaldo de la base de datos
#
fecha=$(date)

mysqldump -u $usuario_mysql -p $contrasena_mysql $base_de_datos > respaldo_$fecha.sql

# Comprimo el respaldo y lo transfiero

gzip < respaldo_$fecha.sql | rsync -avh --progress -e ssh - user@hostdelservidorRESPALDO:/home/backup

# Eliminar el respaldo local comprimido
rm respaldo_$fecha.sql.gz

echo "Respaldo completado, presiona para volver al menu"
./SUM.sh
