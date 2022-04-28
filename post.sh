#!/bin/bash

# combine the coef files
cat regression_coefs/coef_*.csv > combinecoefs.csv

# take the mean of the combined file and write it to a smaller file
cat combinecoefs.csv | { sum=0; while read $1; do sum=$(($sum + $1)); done; } | bc > smallcombinecoefs.csv

#awk  '{ total += $1; count++ } END { print total/count }' combine.csv > smallcombine.csv
#awk '{total += $2; count++ } END { print total/count }' combine.csv >> smallcombine.csv
#awk '{total += $3; count++ } END { print total/count }' combine.csv >> smallcombine.csv
#awk '{total += $4; count++ } END { print total/count }' combine.csv >> smallcombine.csv

# call R on the smaller file
