# connect to PostgreSQL Database for Shiny app

# create connection
connectPostgre <- function(){
  library(dplyr)
  houses <- src_postgres(dbname = "houses", host = "localhost", user = "gkredila")
}

# just links to database. Data is not local in R
connectTables <- function(){
  citynums.db <- houses %>% tbl("citynums")
  housedetails.db <- houses %>% tbl("housedetails")
}

# transfer table data into R local data
getCityNums <- function(){
  citynums.df <- citynums.db %>% group_by(cityid)
  citynums.df.sh <- collect(citynums.df)
  return(citynums.df.sh)
}

getHouseDetails <- function(){
  housedetails.df <- housedetails.db %>% group_by(cityid)
  housedetails.df.sh <- collect(housedetails.df)
  return(housedetails.df.sh)
}
