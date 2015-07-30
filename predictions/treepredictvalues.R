# rpart function to grow a tree --> rpart(formula, data= , method= )
# formula --> outcome ~ predictor1, predictor 2, predictor3, etc
# data= specifies data frame to obtain predictor values
# method= can either be "class" (for a classification tree) 
# (cont.) or "anova" for a regression tree

# double-check the location of loadPackages.R or there'll be an error message!!!
# make sure working directory is /git
# double check under session in menu bar
source("install-loadPackages/loadPackages.R")

# controls can be used after specifying method, but were not used in this example
# edit origprice to sellprice ****
tree.rpart <- rpart(sellprice ~ numlvl + bathnum + bednum + yrbuilt
                            + landsz + condtn + housesz, data = housedetails, method = "class")

# printcp(housedetails_rpart) # display results
jpeg(filename="Plots/crossValidationResults.jpg")
plotcp(tree.rpart, main="Cross-validation Results for Classification Tree")  # display cross-validation results
dev.off()

# display detailed results with splits
# save summary to a text file in same directory (predictions)
sink(file = "predictions/housedetailsSummary.txt")
summary(tree.rpart)
sink(NULL)

# $cptable function of rpart indicates if tree should be 'pruned' 
# locate Xerror crossvalidation error (smaller number is better)
cptable <- tree.rpart$cptable

# Prune back the large initial tree, if necessary
tree.prune <- prune(tree.rpart, cp = 0.1)

# as.party is part of partykit package
# plot(as.party()) function plots and displays box models from rpart tree
# rpart tree is housedetails_rpart
# zoom in plot box to see larger plot 
# export to save plot to location
jpeg(filename="Plots/sellPricePredictions.jpg")
plot(as.party(tree.rpart, main="Sell Price Predictions Based on House Size"))
dev.off()
