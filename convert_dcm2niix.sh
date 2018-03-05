#!/bin/bash

var=(
'Armengol'
'Belmont'
'Castro'
'Mendoza'
'Munoz'
'Muñoz'
'Perez'
'Serret')

for fil in ${var[@]}
do
   echo $fil
   /Users/lgsantos/Desktop/dcm2niix-master/bin/bin/dcm2niix -o ./ -f %n%p%s%u%x%z ./$fil/
done
