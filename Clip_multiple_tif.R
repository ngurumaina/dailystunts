#Clipping multiple rasters. coded by Wilson Nguru in November 2019

#load libraries
library (sp)
library (rgdal)
library (raster)
library (maps)
library (mapproj)

#Set your working directory
#setwd("C:/Here_it_is/")
ipath <-  "C:/Users/DELL/Documents/Chrips_1981-83/"

opath <- "C:/Users/DELL/Documents/Chrips_1981-83/rTemp/"


#Identify your polygon boundary
      # directory where the .shp is
ppath <- "D:/GURU/All WORK/Caroline/Zambia/Zambia boundaries" 

#filename of the actual .shp without the extension.
pname <- "gadm36_ZMB_0" 

#Read your polygon boundary
pzambia <- readOGR(ppath,pname) 

#Identify spatial extent
e <- extent(pzambia)

#Projection type and datum, respectively
p1 <- "+proj=UTM"
p2 <- "+datum=WGS84"
projmap <- paste(p1,p2)

#Identify the list of images you wish to perform the loop
chirpsLS <- list.files(ipath, pattern=".tif$", full.names=TRUE)
files <- chirpsLS[c(1:1095)]
chirpfile<- gsub(paste0(ipath), "",files )

#add output directory Note that paste0 forgoes any separator between the two vectors "opath" and "files". 
#if you need to add a slash somewhere then you need to change it to the paste function or change your vectors above.
outfiles <- paste0(opath, chirpfile)

#Change extension
extension(outfiles) <- "tif" #if you want to make it .tif 

for (f in 1:length(chirpfile)){
  r<-raster(files[f])
  rc <- crop(r, e)
  rm <- mask(rc, pzambia)
  rw <- writeRaster(rm,outfiles[f],overwrite=TRUE)
}

