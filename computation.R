rm(list=ls())

# Check that the correct number of argumnets were given, and get the csv filename
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  yellow_taxi_data = args[1]
} else {
  cat('usage: Rscript computation.R <yellow taxi csv>\n', file=stderr())
  stop()
}

# Import Packages
if (require("geojsonio")) {
  print("Loaded package geojsonio.")
} else {
  print("Failed to load package geojsonio.")
}

# Read in csv (variable comes from args)
taxi = read.csv(yellow_taxi_data)
# Drop na values
taxi = na.omit(taxi)
# data cleanup
#take only pickup hour, location_id, and fare_amount columns
taxi = taxi[, c(2,4,8,11)]
#rename them so it is consistent across files
names(taxi) = c("pickup_hour", "num_passengers", "location_id", "fare_amount")
#convert the pickup_hour column to a datetime and then extract just the hour
taxi[[1]] = as.POSIXct(taxi[[1]], format="%Y-%m-%d %H:%M:%S") #
taxi[[1]] = as.numeric(format(taxi[[1]], format="%H"))

# Create multiple linear Regression (Hour of Day, Pickup_Latitude, Pickup_Longitude -> FareAmt)
fit = lm(fare_amount ~ pickup_hour * location_id, data=taxi)
coefs = coef(fit)

# Write to file with the format slope,b1,b2,b1*b2 (interaction)
filename = strsplit(s, "_")[[1]][3] #this will be in the form year-month.csv
filename1 = paste0("coef_", filename) #name the file coef_year-month.csv
filename2 = paste0("counts_", filename) #name the file for sums for plotting
write(unname(coefs), file=filename1, sep=",")


# Get sums of passengers for each borough (location_id)
sums_df = aggregate(taxi$num_passengers, list(taxi$location_id), sum)
#rename the columns
names(sums_df) = c("location_id", "sum")
#write csv file with 2 columns (borough, sum_passengers)
write.csv(sums_df, filename2, row.names = F)