1- Escribiendo el comando umask en la terminal.
2-
MI umask = 0022 (022)
Ficheros 666 - 022 = Mis permisos actuales
Directorio 777 - 022 = Mis permisos actuales
u+g+o = 022
a. 777 - 770 = 006 
b. 666 - 600 = 066
c. 777 - 744 = 022
d. 777 - 655 = 122
e. 777 - 700 = 077

a. Los directorios pueden ser leídos, escritos y ejecutados (accedidos) por
el propietario y por los miembros del grupo, pero no por otros
usuarios.
b. Archivos solo pueden ser leídos y escritos por el propietario, sin
acceso para otros usuarios.
c. Directorios pueden ser accedidos y leídos por todos los usuarios, sólo
el propietario puede modificar el directorio.
d. Directorio pueden ser accedidos por todos los usuarios. El propietario
únicamente puede leer y escribir en directorios.
e. Asegurarse que sólo el propietario pueda eliminar ficheros del
directorio /home/compartida.


