#!/bin/bash
declare -A matriz
matriz[verde]="#FF0000"
matriz[rojo]="#00FF00"
matriz[azul]="#0000FF"

echo ${matriz[verde]}
unset matriz[verde]
echo "No sigue estando: "${matriz[verde]} 
echo "Sacco los indices/clave--> " ${!matriz[@]}