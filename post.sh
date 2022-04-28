#!/bin/bash

# combine the coef files
sort -k1,1 -g -r coef*.csv > combine.csv

# take the mean of the combined file and write it to a smaller file
awk  '{ total += $1; count++ } END { print total/count }' combine.csv > smallcombine.csv
awk '{total += $2; count++ } END { print total/count }' combine.csv >> smallcombine.csv

# call R on the smaller file
