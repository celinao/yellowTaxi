rm(list=ls())

# Import Packages 
if (require("geojsonio")) {
  print("Loaded package geojsonio.")
} else {
  print("Failed to load package geojsonio.")  
}

# Create multiple linear Regression (Hour of Day, Pickup_Latitude, Pickup_Longitude -> FareAmt)

# Create File containing regression coefficients? 

### Find Location of each pickup location 
# Add coords and boro columns 
taxi$coords = paste(taxi$pickup_latitude, taxi$pickup_longitude, sep=",")
taxi$boro = "" 
# Add location for each point 
for (i in 1:nrow(taxi)) {
  coords <- c(taxi$pickup_longitude[i], taxi$pickup_latitude[i])
  point <- sp::SpatialPoints(
    matrix(
      coords,
      nrow = 1
    )
  )
  sp::proj4string(point) <- sp::proj4string(ny)
  polygon_check <- sp::over(point, ny)
  taxi$boro[i] <- as.character(polygon_check$BoroName)
}