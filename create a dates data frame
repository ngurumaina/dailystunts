#Wilson Nguru coded on Nov 2017 while trying to create climate indices for Zambia

# clear your work space
rm(list = ls(all = TRUE))

# load packages
.packages = c("rgdal","raster", "gtools", "snow", "Kendall", "rasterVis", "maptools")
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
lapply(.packages, require, character.only=TRUE)

# set variables
iDir <- "C:/Users/DELL/Documents/Chrips_1981-83/rTemp/"
oDir <- "C:/Users/DELL/Documents/Chrips_1981-83/Rainave/"

mainDir <- "C:/Users/DELL/Documents/Chrips_1981-83"
subDir <- "Rainave"

if (file.exists(subDir)){
  setwd(file.path(mainDir, subDir))
} else {
  dir.create(file.path(mainDir, subDir))
  oDir<-(file.path(mainDir, subDir))
  
}

# create a date dataset
dateLS <- seq(as.Date("1981-1-1"), as.Date("1983-12-31"), by = "days")
dateLS <- data.frame(dateLS)
dateLS$year <- substr(dateLS$dateLS, 1, 4)
dateLS$month <- substr(dateLS$dateLS, 6, 7)
dateLS$day <- substr(dateLS$dateLS, 9, 10)
dateLS$date <- gsub("-", "", dateLS$dateLS)
dateLS <- c(dateLS$date)


#create data frame for the dates
dates<-as.Date(dateLS, format = "%Y%m%d")
date.df <- data.frame(date = dates,
                 year = as.numeric(format(dates, format = "%Y")),
                 month = as.numeric(format(dates, format = "%m")),
                 day = as.numeric(format(dates, format = "%d")))


#Another way of doing this
#datez<-as.Date(dateLS, format ='%Y%m%d')
#datedf<-data.frame(date =datez)
#library(lubridate)
#datedf$year <- year(ymd(datedf$date))
#datedf$month <- month(ymd(datedf$date)) 
#datedf$day <- day(ymd(datedf$date))
#datedf

#Add day of year column to the data frame
library(lubridate)
date.df$doy<-lubridate::yday(date.df$date)
date.df


#identify leap years
year<- date.df$year
year<-as.numeric(year)
# Function to identify leap years
is.leapyear <- function(y){ return(((year %% 4 == 0) & (year %% 100 != 0)) | (year %% 400 == 0)) }
Leap <- is.leapyear(year)




