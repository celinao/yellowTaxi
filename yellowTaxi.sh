#!/bin/bash

# Download the file
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$1.csv

# Strip the columns not needed
ls

# Untar the R installation
tar -xzf R402.tar.gz
# TODO: Untar the R packages

# Make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# Run the script
Rscript yellowTaxi.R

# Remove the file so it doesn't get copied back
# We can circumvent this by saving it to a data directory
rm -f yellow_tripdata_$1.csv