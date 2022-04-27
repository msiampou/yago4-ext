#!/bin/sh
labels=`ls ../data/gag/labels/*.nt`
for file in $labels
do
    echo $file
    dir=$(echo $file | awk -F "/" '{print $5}')
    echo $dir
    line=$(cat $file | sed 's/\|/ /' | awk '{print $1}' | awk -F "<" '{print $2}')
    echo $line
    grep -nhr "$line" "../data/gag/geometries.nt" > ../data/gag/geometries/$dir
done