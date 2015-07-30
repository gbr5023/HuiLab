# install all packages needed

# connection to database
# Prior, install Postgre App and connect to port server
install.packages("RPostgreSQL", type = "source") # connect to PostgreSQL

# use in "treepredictvalues.R"
install.packages("rpart, dependencies = TRUE")
install.packages("partykit, dependencies = TRUE")

# use in "geocodeAddresses.R"
install.packages("ggmap, dependencies = TRUE")
