#!/usr/bin/env bash

ruta=../../Documents/peliculas
find $ruta -type f -name "*" > listadoborrar.txt
while read -r peli
do
    nuevonombre= $(echo $peli | sed 's/ /_/g')
    mv "$peli" "$nuevonombre" 
done < listadoborrar.txt