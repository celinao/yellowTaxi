# yellowTaxi

- Downloading the Data/Pre-format data (Sam) 
- Sub file to call each file (Sam)
- Shell file to (Sam)
  - Install R 
  - Install Packages 
  - Call R 
- R file 
  - Create multiple linear regression (Hour of Day, Starting Lat, Starting Lon -> FareAmt) 
  - Create file for regression coefficients 
  - Create a file for (PULocationID, Time, # of Pickups) 
- Post-Processing Shell File
  - Combine Regression coefficients into 1 model 
  - Combine location files 
  - Call post-R 
- R file (Celina) 
  - Graph Regression 
  - Graph Locations 
  - Shiny App 



# Proposal Comments 

**John's Comments**
- Seems lightweight on the computations. Add **confidence intervals** for each mean? (potentially regression model) 
- Can you use the lat/lon to create a heatmap for location? 


I think we could add confidence interval calculations to increase the computations. 
We could do a regression model but, that's what everyone else is doing anyways. :( 
  
 We could try to create a time-series graph for week/month/year. Think gg_season(period="week"). That would add to visualizations and 
 a little in computations since we'd need to convert to a tsibble but, it still wouldn't do much computation wise. 
