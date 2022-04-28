for filename in borough_counts/counts_*.*
do
 # Get the year and month of each file 
 year=$(echo $filename | cut -c 23-26)
 month=$(echo $filename | cut -c 28-29)

 # Append the year and month to the end of each line 
 sed 's/$/,'"$year"','"$month"'/g' $filename | 
 sed 's/"location_id","sum",.*/"location_id","passengers","year","month"/' 
done > total_counts.csv