#EJERCICIO 1
#!/bin/bash
echo "Ingrese su nombre: "
read nombre
#Toma la variable y la imprime
echo "Hola! $nombre "

#EJERCICIO 2
#!/bin/bash
echo "Ingresa un numero "
read num1
echo "Ingresa otro número "
read num2
let suma=num1+num2
echo "La suma es: $suma "
let resta=num1-num2
echo "La resta es: $resta "
let producto=num1*num2
echo "El producto es: $producto "
#Si la variable $num2 es igual a 0, no dejará dividir
if [ $num2 -ne 0 ]; then
        let cociente=num1/num2
        echo "El cociente es: $cociente "
else
        echo "No se puede dividir entre 0"
fi

#EJERCICIO 3
#!/bin/bash

echo "Ingrese directorio: "
read directorio

#Si el directorio existe, etonces lo buscará
if [ -d "$directorio" ]; then
        echo "Archivos en el directorio "$directorio" "
        ls $directorio
else
        echo "No se ha encontrado directorio"
fi

#EJERCICIO 4
#!/bin/bash

echo "Escribe la ruta del archivo: "
read ruta

#Si la ruta existe, imprime el conteo
if [ -f "$ruta" ]; then
        lineas=$(less "$ruta" | wc -l)
        echo "El archivo "$ruta" contiene "$lineas" lineas"
else
        echo "No existe el archivo"
fi

#EJERCICO 5
#!/bin/bash

echo "Ingrese su fecha de nacimiento en el orden AAAA-MM-DD: "
read fecha_n

#Obtengo la fecha actual con date
fecha_a=$(date +%Y-%m-%d)

#Calculo la edad en años
#Tomo la primera columna de amboos con AWK que sería el año con separador "-"
edad=$(echo $fecha_a | awk -F- '{print $1}')
edad2=$(echo $fecha_n | awk -F- '{print $1}')

#Calculo resultado
let ed=$edad-$edad2

#Imprimo resultado
echo "Su edad es $ed"

#EJERCICIO 6
#!/bin/bash

echo "Escribe nombre del archivo: "
read archivo

#Si el archivoo existe, se procede
if [ -e "$archivo" ]; then
        echo "El archivo existe"
        echo "Escriba la ruta destino a guardar: "
        read ruta
        cp $archivo $ruta
        echo "El archivo $archivo fue copiado a la ruta $ruta: "
        ls $ruta
else
        echo "El archivo no existe"
fi

#EJERCICIO 7
#!/bin/bash

echo "Escribe nombre o ruta del archivo: "
read archivo

        echo "Escribe una palabra a filtrar: "
        read palabra
#Buscamos con grep la palabra dentro del archivo, si existe una coincidencia, imprime resultados
if  grep -q $palabra $archivo; then
        echo "Se han encontrado las siguientes coincidencias: "
        grep -w $palabra $archivo
else
        echo "La palabra  no existe"
fi

#EJERCICIO 9
#!/bin/bash

#Generamos el número aleatorio
numero=$(( 1 + $RANDOM % 100))

echo "Escribe un número entre el 1 y 100: "
read respuesta
#"echo $numero" para corroborar que el while termine cuando se de al número
#Mientras la variable escrita sea diferente al número random...
while [[ $numero -ne $respuesta ]];
do
        if [[ $respuesta -lt $numero ]]; then
        echo "El número es mayor"
        read respuesta
else
        echo "El número es menor"
        read respuesta

fi
done

echo "Has dado con el número correcto! $numero"


#EJERCICIO 10
#!/bin/bash
menu () {
echo "Calculadora diseñada en Shell Script."
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
echo "0) Salir"
echo "Elije una opción: "
}
menu
suma () {
	echo "Ingrese un número"
	read num1
	echo "Ingrese otro"
	read num2
	local resultado=$(($num1 + $num2))
	clear #Limpia la terminal
	menu  #Imprime de nuevo el menú
	echo "El resultado de la suma es: $resultado "
}

resta () {
        echo "Ingrese un número"
        read num1
        echo "Ingrese otro"
        read num2
        local resultado=$(($num1 - $num2))
        clear
        menu
        echo "El resultado de la resta es: $resultado "
}

multi  () {
        echo "Ingrese un número"
        read num1
        echo "Ingrese otro"
        read num2
        local resultado=$(($num1 * $num2))
        clear
        menu
        echo "El resultado de la multiplicación es: $resultado "
}
dividir () {
        echo "Ingrese un número"
        read num1
        echo "Ingrese otro"
        read num2
if [$num2 -ne 0]; then
	        local resultado=$(($num1 / $num2))
        clear
        menu
        echo "El resultado de la división es: $resultado "
else
	clear 
	menu
        echo "No se puede dividir entre 0"
fi
}


#While true hasta que el usuario salga por su medio con una opción, mientras no haya opción correcta no podrá continuar.
#Se utiliza un case para la elección de funciones
while true; do
	read op
case $op in
	1)suma;;
	2)resta;;
	3)multi;;
	4)dividir;;
	0) echo "Saliendo"
		exit;;
	*) echo "Opción incorrecta";;
esac
done


#EJERCICIO 11 Se ejecuta el comando con los nombres de archivos a buscar "./ej11.sh archivo.sh archivo2.sh
#!/bin/bash

for archivo in "$@"
do
        if [ -f "$archivo" ]
        then
                echo "El/los archivo/s $archivo existe. Mostrando resultados: "
                less "$archivo"
        else
                echo "No existe coincidencias"
        fi
done

#EJERCICO 12
#!/bin/bash

echo "USUARIOS DIRECTORIO INTERPRETE"
# Ordeno alfabeticamente los los nombres del archivo passwd, imprimo las columnas 1,6 y 7 con el delimitador ":"
sort /etc/passwd | awk -F ":" '{print $1" "$6" "$7" "}'

~






