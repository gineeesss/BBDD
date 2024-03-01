#!/usr/bin/env bash

if (( $# < 2)); then
    echo "ERROR: debes introducir una extensión"
    exit 2
fi    
echo $#  

ruta=../../Documents/peliculas
find "$ruta" -type f -name "*.$1" > listadoborrar.txt
while read -r peli
do
  nuevonombre="${archivo%.*}"
  mv "$archivo" "$nuevonombre".$2
  echo ""$archivo" --> "$nuevonombre" ... modificado" 
done < listadoborrar.txt

# a los archivos con extension mkv en mayúsculas , ponerlos en minúsculas
# remplazar los espacios por guione bajos

# echo $? devuelve el código de error del script anterior
# PLANTILLA BASICA PARA AUTOMATIZACION
