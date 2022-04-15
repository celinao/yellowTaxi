#!/bin/bash

#replace filename with $1
unzip -j taxis.zip yellow_tripdata_2009-01.csv

#replace filename with $1
cat yellow_tripdata_2009-01.csv |
cut -d, -f2,13 |
awk '{gsub("[0-9|-]+","",$1)}1'|
awk '{gsub(":[0-9]{2}","",$1)}1' |
tail -n +3 > extract_yellow_tripdata_2009-01.csv #replace with extract_$1

#remove the file that was unzipped so that there aren't 2 huge files
#replace filename with $1
rm yellow_tripdata_2009-01.csv  
 
