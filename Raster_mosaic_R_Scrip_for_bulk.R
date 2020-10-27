#dependences
library(raster)
library(stringr)
#list the files from you source folder
rasters<-list.files(path = "/Users/Ahmad/Desktop/I37", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

#create a loop to go through each file in the list, read it as raster and add it to a list of processed images
rasterised_list <- NULL
for (i in 1:length(rasters)) {rasterised_list<- c(rasterised_list, raster(str_replace_all(paste('/Users/Ahmad/Desktop/I37/', rasters[i]), fixed(" "), "")))}

#Add the arguments necessary for mosaic function
rasterised_list$fun <- mean
rasterised_list$na.rm <- TRUE
#do.call allows us to use the mosaic function with our raster list as our arguments rather than typing each path manually
y <- do.call(mosaic, rasterised_list)
#exports the mosaic to a destination folder
writeRaster(y, filename = "/Users/Ahmad/Desktop/mosaiced.tif")
