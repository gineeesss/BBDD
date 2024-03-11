#!/usr/bin/env bash
#contar numero de directorios
ruta=../../Documents/peliculas
while[ 0 ]
do

    echo "MENU "
    echo "Contar Directorios"
    echo "Contar Películas"
    echo "Contar Salir"
    read hola

    case "${hola}" in
    1)
        find "$ruta" -name "*" -type d | wc -l
        ;;
    2)
        find "$ruta" -name "*" -type f | wc -l
        ;;
    3)
        echo "Programa Cerrado"
        exit
        ;;
    esac
done