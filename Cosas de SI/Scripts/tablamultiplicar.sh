#!/usr/bin/env 

# internal line separation
while read -r operacion
do
    echo -n $operacion >> resu.txt
    echo -n = >> resu.txt  
    echo $operacion | bc
done < ./asda.txt

