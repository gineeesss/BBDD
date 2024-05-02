#!/usr/bin/env bash

ruta=../../Documents/peliculas

find $ruta -type f -name "*" > listadoborrar.txt
while read -r peli
do
    nuevonombre= $(echo $peli | sed 's/ /_/g')
    echo $peli "-->" $nuevonombre..................................................
    if [[ "${directorio}" != "${nuevacarpeta}" ]]; then
        mv "$peli" "$nuevonombre" 
    fi
done < listadoborrar.txt
