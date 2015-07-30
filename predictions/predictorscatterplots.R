# scatter plots for each predictor variable
# according to variable importance established in treepredictvalues.R file

# using summary(housedetails_rpart) to display variable importance results
# view summary as text file in predictions folder
# to save file, choose format and its respective driver along with file destination

# make sure working directory is /git
# double check under session in menu bar

# plot housesz & store plot
jpeg(filename = "Plots/housesz.jpg")
plot(housedetails$housesz, housedetails$sellprice, main="House Size vs. Sell Price")
dev.off() # DON'T forget this after saving plots


# plot landsz & store plot
jpeg(filename = "Plots/landsz.jpg")
plot(housedetails$landsz, housedetails$sellprice, main="Land Size vs. Sell Price")
dev.off()


# plot bednum & store plot
jpeg(filename = "Plots/bednum.jpg")
plot(housedetails$bednum, housedetails$sellprice, main="Number of Beds vs. Sell Price")
dev.off()


# plot bathnum & store plot
jpeg(filename = "Plots/bathnum.jpg")
plot(housedetails$bathnum, housedetails$sellprice, main="Number of Bathrooms vs. Sell Price")
dev.off()


# plot numlevel & store plot
jpeg(filename = "Plots/numlevel.jpg")
plot(housedetails$numlevel, housedetails$sellprice, main="Number of Floors vs. Sell Price")
dev.off()


# plot yrbuilt & store plot
jpeg(filename = "Plots/yrbuilt.jpg")
plot(housedetails$yrbuilt, housedetails$sellprice, main="Year Built vs. Sell Price")
dev.off()


# plot condtn & store plot
jpeg(filename = "Plots/condtn.jpg")
plot(housedetails$condtn, housedetails$sellprice, main="Condition of House vs. Sell Price")
dev.off()
