# connect to PostgreSQL Database for Shiny app

# create connection 
library(dplyr)
houses <- src_postgres(dbname = "houses", host = "localhost", user = "gkredila")

# just links to database. Data is not local in R
citynums.db <- houses %>% tbl("citynums")
housedetails.db <- houses %>% tbl("housedetails")

# transfer table data into R local data
citynums.df <- citynums.db %>% group_by(cityid)
citynums.df.sh <- collect(citynums.df)

housedetails.df <- housedetails.db %>% group_by(cityid)
housedetails.df.sh <- collect(housedetails.df)