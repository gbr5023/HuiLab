# set up database & tables in Postgre or in pgAdmin3

# double-check the location of loadPackages.R or there'll be an error message!!!
# make sure working directory is /git
# double check under session in menu bar
source("install-loadPackages/loadPackages.R")

# dbDriver function creates driver object for PostgreSQL
# dbConnect function creates connection to specified database
# dbListTables function lists tables in specified database
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "houses")
dbListTables(con)

# use dbReadTable function to retrieve all data in specified table into data set
housedetails <- dbReadTable(con, "housedetails")
citynums <- dbReadTable(con, "citynums")
generalinput <- dbReadTable(con, "generalinput")

# sample code to remove whitespace in specific variable
housedetails$street <- gsub(" ", "", housedetails$street, fixed = TRUE)

# ============ when completely finished ============= #

# close connection to PostgreSQL
dbDisconnect(con)

# free all resources on PostgreSQL driver
dbUnloadDriver(drv)