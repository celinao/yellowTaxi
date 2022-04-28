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
taxi = taxi[, c(2,8,11)]
#rename them so it is consistent across files
names(taxi) = c("pickup_hour", "location_id", "fare_amount")
#convert the pickup_hour column to a datetime and then extract just the hour
taxi[[1]] = as.POSIXct(taxi[[1]], format="%Y-%m-%d %H:%M:%S") #
taxi[[1]] = as.numeric(format(taxi[[1]], format="%H"))

# Create multiple linear Regression (Hour of Day, Pickup_Latitude, Pickup_Longitude -> FareAmt)
fit = lm(fare_amount ~ pickup_hour * location_id, data=taxi)
coefs = coef(fit)

# Write to file with the format slope,b1,b2,b1*b2
filename = strsplit(s, "_")[[1]][3] #this will be in the form year-month.csv
filename = paste0("coef_", filename) #name the file coef_year-month.csv
write(unname(coefs), file=filename, sep=",")