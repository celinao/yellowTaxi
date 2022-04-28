#!/bin/bash

# combine the coef files
cat regression_coefs/coef_*.csv > combinecoefs.csv

# take the mean of the combined file and write it to a smaller file
cat combinecoefs.csv | 
cut -d , -f 1 | awk  '{ total += $1; count++ } END { print total/count }' > smallcombinecoefs.csv

cat combinecoefs.csv |
cut -d , -f 2 | awk  '{ total += $1; count++ } END { print total/count }' >> smallcombinecoefs.csv

cat combinecoefs.csv |
cut -d , -f 3 | awk  '{ total += $1; count++ } END { print total/count }' >> smallcombinecoefs.csv

cat combinecoefs.csv |
cut -d , -f 4 | awk  '{ total += $1; count++ } END { print total/count }' >> smallcombinecoefs.csv

# call R on the smaller file named smallcombinecoefs.csv
