# ui.R

shinyUI
(
  fluidPage
  (
    titlePanel("Mililani Mauka Sell Price Predictions"),
    
    sidebarLayout(position = "right",
                  
      sidebarPanel(
          helpText("Please enter all house attributes below: "),
            selectInput("select1", label = h6("Choose neighborhood: "), 
                        choices = list("Mililani Mauka" = 1, "Other" = 2, 
                                       selected = 1)
            ),
            sliderInput("slider1", label = h6("** Choose house size (SQ FT): "),
                         min = 0, max = 3500, value = 1700
            ),
            sliderInput("slider2", label = h6("Choose land size (SQ FT): "),
                         min = 0, max = 10000, value = 5000
            ),
            selectInput("select2", label = h6("Number of bedrooms: "), 
                        choices = list("1" = 1, "2" = 2, "3" = 3, 
                                       "4" = 4, "5" = 5, "6" = 6,
                                       "7" = 7, "8" = 8, "9" = 9,
                                       "10" = 10, selected = 1)
            ),
            selectInput("select3", label = h6("Number of bathrooms: "), 
                        choices = list("1" = 1, "1.5" = 2, 
                                       "2" = 3, "2.5" = 4,
                                       "3" = 5, "3.5" = 6, 
                                       "4" = 7, "4.5" = 8,
                                       "5" = 9, selected = 1)
            ),
            selectInput("select4", label = h6("Number of floors: "),
                         choices = list("1" = 1, "1.5" = 2, 
                                        "2" = 3, "2.5" = 4,
                                        "3" = 5, "3.5" = 6, 
                                        "4" = 7, "4.5" = 8,
                                        "5" = 9, selected = 1)
            ),
            textInput("text1", label = h6("Year Built: ")
            ),
            textInput("text2", label = h6("** Target Sell Price : ")
            ),
            p("** required"),
            submitButton("Submit"),
            img(src = "huiLogo.png", height = 160, width = 250),
              p("Product of the Hawaii Urban Innovation (HUI) Lab."),
              p("Creator: Giselle Redila")
            ),
      
      mainPanel(
        h4("Sell Range Prediction"),
        tableOutput("table1"),
        tableOutput("table2"),
        textOutput("text1"),
        plotOutput("plot1")
      )
    )
  )
)