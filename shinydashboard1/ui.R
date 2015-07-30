## ui.R ##

library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Sell Price Predictions"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Predictions", tabName = "dashboard", icon = icon("angle-double-right")),
      menuItem("Plots", tabName = "plot", icon = icon("angle-double-right"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard", 
              fluidRow(
                tabBox(
                  title = "Price Predictors", id = "tabset1", 
                  status = "primary", side = "right", width = 12,
                  selected = "Parameters",
                  tabPanel("Parameters",
                           tableOutput("table2")
                  ),
                  tabPanel("Price Prediction",
                           tableOutput("table1"),
                           ## hide error messages ##
                           tags$style(type="text/css",
                                      ".shiny-output-error { visibility: hidden; }",
                                      ".shiny-output-error:before { visibility: hidden; }"
                           ),
                           "** If prediction does not display, enter house parameters and submit **"
                  )
                )
              ),
              
              fluidRow(
                box(
                  title = "Basic Info", width = 4, solidHeader = TRUE, background = "navy",
                  selectInput("select1", label = h6("Choose neighborhood: "), 
                              choices = list("Mililani Mauka" = 1, "Other" = 2, 
                                             selected = 1)
                  ),
                  sliderInput("slider1", label = h6("Choose house size (SQ FT): "),
                              min = 0, max = 3500, value = 0
                  ),
                  sliderInput("slider2", label = h6("Choose land size (SQ FT): "),
                              min = 0, max = 10000, value = 0
                  )
                ),
                
                box(
                  title = "Quantitive Info", width = 4, solidHeader = TRUE, background = "olive",
                  selectInput("select2", label = h6("Number of bedrooms: "), 
                              choices = list("1" = 1, "2" = 2, "3" = 3, 
                                             "4" = 4, "5" = 5, "6" = 6,
                                             "7" = 7, "8" = 8, "9" = 9,
                                             "10" = 10, selected = 1)
                  ),
                  selectInput("select3", label = h6("Number of bathrooms: "), 
                              choices = list("1" = "1", "1.5" = "1.5", 
                                             "2" = "2", "2.5" = "2.5",
                                             "3" = "3", "3.5" = "3.5", 
                                             "4" = "4", "4.5" = "4.5",
                                             "5" = "5", selected = 1)
                  ),
                  selectInput("select4", label = h6("Number of floors: "),
                              choices = list("1" = "1", "1.5" = "1.5", 
                                             "2" = "2", "2.5" = "2.5",
                                             "3" = "3", "3.5" = "3.5", 
                                             "4" = "4", "4.5" = "4.5",
                                             "5" = "5", selected = 1)
                  )
                ),
                
                box(
                  title = "Build and Target Info", width = 4, solidHeader = TRUE, background = "teal",
                  textInput("text1", label = h6("Year Built: ")
                  ),
                  textInput("text2", label = h6("Target Sell Price : ")
                  ),
                  submitButton("Submit")
                )
              )
      ),
      
      tabItem(tabName = "plot",
              fluidRow(
                tabBox(
                  title = "Price Predictors", id = "tabset2",
                  side = "right", height = 500, width = 12,
                  selected = "House Size",
                  tabPanel("Year", status  = "danger",
                           plotOutput("plot6")
                  ),
                  tabPanel("Floors", status  = "warning",
                           plotOutput("plot5")
                  ),
                  tabPanel("Bathrooms", status = "success",
                           plotOutput("plot4")
                  ),
                  tabPanel("Bedrooms", status = "info",
                           plotOutput("plot3")
                  ),
                  tabPanel("Land Size", status = "success",
                           plotOutput("plot2")
                  ),
                  tabPanel("House Size", status = "primary",
                           plotOutput("plot1")
                  )
                )
              )
      )
    )
  ),
  skin = "purple"
)