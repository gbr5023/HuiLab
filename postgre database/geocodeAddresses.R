# use ggmap package to geocode house addresses

# double-check the location of loadPackages.R or there'll be an error message!!!
# make sure working directory is /git
# double check under session in menu bar
source("install-loadPackages/loadPackages.R")

# geocode function with paste function into temporary data frame
temp <- geocode(paste(housedetails$adrnum, housedetails$street, housedetails$state, housedetails$zip))

# update/append geocode results to current housedetails data frame
housedetails$longitude <- temp$lon
housedetails$latitude <- temp$lat

# remove temporary data frame 
rm(temp)

# =============================================

# *** obtain .csv file of housedetails data frame (use code below) ***
write.csv(file = "postgre database/housedetails.csv", x = housedetails)
