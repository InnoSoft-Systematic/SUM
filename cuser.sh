#!/bin/bash
#Matías VILLAGRÁN 3ºBB Nocturno
#GRUPO HELLFIRE
#SUM V1.02 (Se agrega opción de modificar esqueleto)

echo "Creación de usuarios"
echo "1) Crear usuario por defecto"
echo "2) Crear usuario personalizado"
echo "3) Volver"
read op

#Siempre agregar las funciones al principio del código, sino no las lee.
function nombre () {
	#Funcion para el ingreso de usuario con configuraciones por defecto
	echo "Ingresa nombre de usuario a crear"
	read nombre
	#Ingresa la rura del esqueleto, (ejemplo /home/matias/skel)
	echo "Ingrresa ruta del esqueleto"
	read esqueleto
	#Comando "useradd", donde "-m" crea automaticamente el directorio de inicio y copiará los directorios del ESQUELETO.
	#El ESQUELETO es el directorio predeterminado de las carpetas y archivos que tendra el usuario.
	#La funcion "-k" especifica un esquelto personalizado, seguido iria la ruta del mismo (que está guardada en la variable).
	useradd -m -k $esqueleto $nombre
	echo "El usuario $nombre ha sido creado correctamente!"
}
function nmenu () {
	#Función para el ingreso de de usuario personalizado
	echo "Ingresa nombre de usuario a crear"
	read nombre1
	echo "Ingresa dirección del esqueleto"
	read esqueleto1
	echo "¿Añadir comentario? 1(Si)/2(No)"
	read com
	#Si es 1, entoces permitirá ingresar un comentario
	if [ $com -eq 1 ]; then
		echo "Escriba el comentario"
		read comentario
	else
		echo "Ok"
	fi
	#Ingreso de número o nombre de grupo, se pueden ver sus números y nombres en el script groups.sh
	echo "Ingresa numero o nombre de grupo"
	read group
	#Directorio debe ser un ruta como /home/matias/
	echo "Ingresa directorio"
	read directorio
	#Pregunta si la cuenta va a expirar
	echo "¿La cuenta expira? 1(Si/2(No)"
	read expira
	#Si expira, le pide que ingrese fecha de expiración
	if [ $expira -eq 1 ]; then
		echo "Ingresa la fecha de expiración en formato YYYY-MM-DD"
		read exp
	else
		echo "Ok"
	fi
	#Comando final
	#"-c" especifica comnentario, "-g" el grupo, "-d" el directorio y "-e" si expira
	useradd -m -k $esqueleto1 -c $com -g $group -d $directorio -e $expira $nombre1
	echo "Usuario $nombre1 creado exitosamente"
}
case $op in
	1)nombre;;
	2)nmenu;;
	3)./SUM.sh;;
esac	

