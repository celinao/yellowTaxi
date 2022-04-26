# Generates filenames.txt, which we will use to iterate over all files

# Create temporary file
rm -f tmp
touch tmp

# Loop over all years
for year in `seq 2009 2021`; do
    # Loop over all months
    for month in `seq 101 112`; do
        newMonth=`echo $month | cut -c 2-`
        # Add year-month to filenames.txt
        echo $year-$newMonth >> tmp
    done
done

# Remove last months of 2021 that have not been added yet
head -n -5 tmp > filenames.txt
rm -f tmp
