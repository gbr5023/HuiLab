# server.R
shinyServer(
  function(input, output) {
    
      output$table1 <- renderTable({
        shinypredictors_df <- data.frame("House" = input$slider1, "Land" = input$slider2,
                                         "Bedrooms" = input$select2, "Bathrooms" = input$select3,
                                         "Floors" = input$select4, "Built" = input$text1,
                                         "Target" = input$text2)
    })
    
    output$table2 <- renderTable({
      shinypredictors_df <- data.frame("housesz" = input$slider1, "sellprice" = input$text2)
      h_df[nrow(h_df)+1,] <- c(shinypredictors_df$housesz,shinypredictors_df$sellprice)
      shinyvalues_lm <- lm(sellprice ~ housesz, data = h_df)   
      shinypredict <- data.frame(predict(shinyvalues_lm, newdata = h_df, 
                                         interval = "confidence"))
      shinypredict2 <- data.frame(shinypredict[27,])
      row.names(shinypredict2) <- NULL
      print(shinypredict2, row.names =  FALSE)
    })
    output$text1 <-renderText({

    })
    
    output$plot1 <- renderPlot({
      shinypredictors_df <- data.frame("housesz" = input$slider1, "sellprice" = input$text2)
      h_df[nrow(h_df)+1,] <- c(shinypredictors_df$housesz,shinypredictors_df$sellprice)
      plot(h_df$housesz, h_df$sellprice)
    })
  }
)