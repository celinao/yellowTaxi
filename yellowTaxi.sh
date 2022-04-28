#!/bin/bash

# Download the file
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$1.csv

# TODO: Strip the columns not needed

# Untar the R installation and packages
tar -xzf R402.tar.gz
#tar -xzf packages.tar.gz

# Make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# Run the script
Rscript computation.R ./yellow_tripdata_$1.csv

# Remove the file so it doesn't get copied back
# We can circumvent this by saving it to a data directory
rm -f yellow_tripdata_$1.csv
