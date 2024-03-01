#!/usr/bin/env bash
declare -A matrizext
find ./pelis -type f -name "*" > listadopeliculas.txt
while read -r peli
do
    extension="${peli##*.}"
#    echo $extension
    if [[ ${matrizext[$extension]} -lt 1 ]] 
    then
        matrizext[$extension]=1
    else
        matrizext[$extension]=$(( ${matrizext[$extension]} + 1 ))
    fi
done < listadopeliculas.txt
echo "Las extensiones son: "
for extension in ${!matrizext[@]}
do
    echo $extension "-->" ${matrizext[$extension]}
done