#!/bin/bash
param0=$0
param1=$1
param2=$2
echo ${param0} ${param1} ${param2}
echo "Pasaste $# parametros"
echo "Mira todos los parametros: $@"

declare -a miarray=$@
contador
for item in $miarray; do
    echo "Elemento: ${item}"
    contador=$(($contador + 1))
    echo ${contador}
done
echo ${miarray[2]};
echo ${miarray[1]};
echo ${!miarray[@]};

# for((i=1;i<$#;i++)); do
#     echo "De otra manera ${miarray}[$i]"
# done    