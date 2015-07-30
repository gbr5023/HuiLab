## server.R ##

library(shinydashboard)
library(ggplot2)
library(plyr)
library(data.table)

function(input, output) {
 
  ## create data frame with just house predictors from housedetails ##
  housepredictors.df.sh <- data.frame("bathnum" = housedetails.df.sh$bathnum, "bednum" = housedetails.df.sh$bednum,
                                      "numlvl" = housedetails.df.sh$numlvl, "yrbuilt" = housedetails.df.sh$yrbuilt,
                                      "landsz" = housedetails.df.sh$landsz, "housesz" = housedetails.df.sh$housesz,
                                      "sellprice" = housedetails.df.sh$sellprice)
  
  ## predict sell price range/fit according to user parameters ##
  output$table1 <- renderTable({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh <- data.frame(rbind(housepredictors.df.sh,userpredictors.df.sh))
    shinydash.lm <- lm(sellprice ~ landsz 
                       + housesz, data = housepredictors.df.sh)   
    shinypredict <- data.frame(predict(shinydash.lm, newdata = housepredictors.df.sh, 
                                       interval = "confidence"))
    shinypredict2 <- data.frame(shinypredict[nrow(shinypredict),])
    row.names(shinypredict2) <- NULL
    print((shinypredict2), row.names =  FALSE)
    
    #if(input$text2 > shinypredict2$lwr && input$text2 < shinypredict2$upr){
    #  print("Target price is good")
    #}
    #else{
    #  print("Change target price. Aim between lower and upper price range")
    #}
  })
  
  ## show user parameters ##
  output$table2 <- renderTable({
    houseparameters.df.sh <- data.frame("Nbrhd" = input$select1, "House" = input$slider1, 
                                        "Land" = input$slider2, "Bed" = input$select2, 
                                        "Bath" = input$select3, "Floors" = input$select4, 
                                        "Built" = input$text1, "Target" = input$text2)
  })
  
  ## plot house size against sell price ##
  output$plot1 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                   "numlvl" = input$select4, "yrbuilt" = input$text1,
                                   "landsz" = input$slider2, "housesz" = input$slider1,
                                   "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    housesz <- qplot(housesz, sellprice, data = housepredictors.df.sh, xlim = c(500,3500),
                ylim = c(200000,2000000),xlab = "House Size", ylab = "Sell Price", 
                color = "blue", main = "House Size vs. Sell Price")
    housesz + theme(legend.position="none")
  })
  
  ## plot land size against sell price ##
  output$plot2 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    landsz <- qplot(landsz, sellprice, data = housepredictors.df.sh,
              ylim = c(200000,2000000), xlab = "Land Size", ylab = "Sell Price", 
              color = "blue", main = "Land Size vs. Sell Price")
    landsz + theme(legend.position="none")
  })
  
  ## plot bedrooms against sell price ##
  output$plot3 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    bednum <- qplot(bednum, sellprice, data = housepredictors.df.sh,
              ylim = c(200000,2000000), xlab = "Bedrooms", ylab = "Sell Price", 
              color = "green", main = "Bedrooms vs. Sell Price")
    bednum + theme(legend.position="none")
  })
  
  ## plot bathrooms again sell price ##
  output$plot4 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    bathnum <- qplot(bathnum, sellprice, data = housepredictors.df.sh,
                ylim = c(200000,2000000), xlab = "Bathrooms", ylab = "Sell Price", 
                color = "purple", main = "Bathrooms vs. Sell Price")
    bathnum + theme(legend.position="none")
  })
  
  ## plot floors against sell price ##
  output$plot5 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    numlvl <- qplot(numlvl, sellprice, data = housepredictors.df.sh,
              ylim = c(200000,2000000), xlab = "Floors", ylab = "Sell Price", 
              color = "orange", main = "Floors vs. Sell Price")
    numlvl + theme(legend.position="none")
  })
  
  ##  plot year against sell price ##
  output$plot6 <- renderPlot({
    userpredictors.df.sh <- data.frame("bathnum" = input$select3,"bednum" = input$select2, 
                                       "numlvl" = input$select4, "yrbuilt" = input$text1,
                                       "landsz" = input$slider2, "housesz" = input$slider1,
                                       "sellprice" = input$text2)
    housepredictors.df.sh[nrow(housepredictors.df.sh)+1,] <- rbind(userpredictors.df.sh)
    yrbuilt <- qplot(yrbuilt, sellprice, data = housepredictors.df.sh, xlim = c(1950,2020),
                ylim = c(200000,2000000), xlab = "Year Built", ylab = "Sell Price", 
                color = "brown", main = "Year Built vs. Sell Price")
    yrbuilt + theme(legend.position="none")
  })
}