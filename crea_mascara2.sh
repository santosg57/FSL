#!/bin/bash

fslmaths -dt float $1 -mul 0 -add 1 -roi $2 1 $3 1 $4 1 0 1 img_point -odt float
fslmaths img_point -kernel sphere 5 -fmean img_sphere -odt float
thresh_it=`fslstats 'img_sphere.nii.gz' -P 10`
echo $thresh_it
media=`fslstats 'img_sphere.nii.gz' -m`
echo $media
des=`fslstats 'img_sphere.nii.gz' -S`
echo $des
hum=`echo "scale=3;$media+$2*$des" | bc`
echo $hum

fslmaths img_sphere -thr $hum -bin mascara_bin -odt float
rm img*

