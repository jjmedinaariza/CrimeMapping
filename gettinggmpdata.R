gmcrime11_17 <- read.csv("2017-11/2017-11-greater-manchester-street.csv") 
gmcrime10_17 <- read.csv("2017-10/2017-10-greater-manchester-street.csv") 
gmcrime09_17 <- read.csv("2017-09/2017-09-greater-manchester-street.csv") 
gmcrime08_17 <- read.csv("2017-08/2017-08-greater-manchester-street.csv") 
gmcrime07_17 <- read.csv("2017-07/2017-07-greater-manchester-street.csv") 
gmcrime06_17 <- read.csv("2017-06/2017-06-greater-manchester-street.csv") 
gmcrime05_17 <- read.csv("2017-05/2017-05-greater-manchester-street.csv") 
gmcrime04_17 <- read.csv("2017-04/2017-04-greater-manchester-street.csv") 
gmcrime03_17 <- read.csv("2017-03/2017-03-greater-manchester-street.csv") 
gmcrime02_17 <- read.csv("2017-02/2017-02-greater-manchester-street.csv") 
gmcrime01_17 <- read.csv("2017-01/2017-01-greater-manchester-street.csv") 
gmcrime12_17 <- read.csv("2017-12/2017-12-greater-manchester-street.csv")


library(dplyr) 
#This will create a list called dsf with the 12 datasets we created earlier 
dfs <- list(gmcrime01_17, gmcrime10_17, gmcrime11_17, gmcrime12_17, gmcrime02_17, 
            gmcrime03_17, gmcrime04_17, gmcrime05_17, gmcrime06_17, gmcrime07_17, gmcrime08_17, 
            gmcrime09_17) 
#This will use a function from the dplyr package to join all these datasets into gmpcrime 
gmpcrime <- bind_rows(dfs) 

#Select only 6 of the variables and change their order using the dplyr select function 
gmpcrime <- select(gmpcrime, Longitude, Latitude, LSOA.code, LSOA.name, Crime.type, Month) 
#Change the variable names 
names(gmpcrime) <- c("long","lat","LSOA_id", "LSOA_name", "crime_type", "month") 
#Save gmpcrime as a csv file 
write.csv(gmpcrime, "gmpcrime.csv") 
