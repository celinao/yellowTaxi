# Generates filenames.txt, which we will use to iterate over all files

# Create temporary file
rm -f tmp
touch tmp

# Loop over all years from 2017
for year in `seq 2017 2020`; do
    # Loop over all months
    for month in `seq 101 112`; do
        newMonth=`echo $month | cut -c 2-`
        # Add year-month to filenames.txt
        echo $year-$newMonth >> tmp
    done
done

# Remove last months after Feb 2020 that inlcude Covid-confounded data
head -n -10 tmp > filenames.txt
rm -f tmp
