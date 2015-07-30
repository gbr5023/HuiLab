# With predictors in housedetails, use predict.lm function from stats package 
# stats package preloaded into RStudio

# double-check the location of loadPackages.R or there'll be an error message!!!
# make sure working directory is /git
# double check under session in menu bar
source("install-loadPackages/loadPackages.R")

# Make predicitons based on the model(housevalues_lm) using lm function
# create formula to determine sellprice from predictors in housedetails data frame
lm.formula <- lm(housedetails$sellprice ~ housedetails$bathnum + housedetails$bednum 
                     + housedetails$numlvl + housedetails$yrbuilt + housedetails$landsz 
                     + housedetails$condtn + housedetails$housesz, data = housedetails)

# store predictors from housedetails into separate new data frame
housepredictors <- data.frame(housedetails$bathnum, housedetails$bednum, 
                              housedetails$numlvl, housedetails$yrbuilt, 
                              housedetails$landsz, housedetails$condtn, 
                              housedetails$housesz)

# store sellprice variable into separate dataframe to compare with 
# (cont.) prediction and confidence results
sellprice <- housedetails$sellprice

# get a matrix with prediction and 95% prediction interval
prediction <- predict(lm.formula, newdata = housepredictors, 
                                   interval = 'prediction')
# change matrices into data frames to add housedetails$sellprice column as sellprice
prediction <- data.frame(prediction)
prediction$sellprice <- sellprice

# get a matrix with prediction and 95% confidence interval around the mean prediction
confidence <- predict(lm.formula, newdata = housepredictors, 
                                     interval = 'confidence')
# change matrices into data frames to add housedetails$sellprice column as sellprice
confidence <- data.frame(confidence)
confidence$sellprice <- sellprice

# remove sellprice data frame
rm(sellprice)
