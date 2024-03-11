#!/usr/bin/env bash
if (( $# < 1)); then
    echo "ERROR: debes introducir una extensión"
    exit 2
fi    
echo $#  
# exit   

ruta=../../Documents/peliculas
find $ruta -type f -name "*.$1" > listadoborrar.txt
while read -r peli
do
    rm -rf "$peli"
    echo "$peli" ... borrado
done < listadoborrar.txt


# echo $? devuelve el código de error del script anterior
# PLANTILLA BASICA PARA AUTOMATIZACION
# #!/usr/bin/env bash
# ruta=../../Documents/peliculas
# find $ruta -type f -name "*.db" > listadoborrar.txt
# while read -r peli
# do
#     
# done < listadoborrar.txt
