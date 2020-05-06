#Step 1 is to load everything I'll need. So yeah, go me. 

library(sf)
library(readr)
library(fs)
library(tidyverse)
library(gganimate)
library(transformr)
library(ggspatial)

#Now I create my two directories that the pset told me to

dir_create("raw-data")
dir_create("clean-data")
dir_create("graphics")

#Here I'm downloading my shape file and data from the project

download.file("https://stacks.stanford.edu/file/druid:hp256wp2687/hp256wp2687_ok_oklahoma_city_shapefiles_2019_08_13.tgz", destfile = "raw-data/oklahoma_city.tgz")
download.file("https://stacks.stanford.edu/file/druid:hp256wp2687/hp256wp2687_ok_oklahoma_city_2019_08_13.rds", destfile = "raw-data/oklahoma_city_rds.rds")

#Gotta untar to use the data properly

untar("raw-data/oklahoma_city.tgz", exdir = "raw-data")

#I like assigning everything to r objects when I'm done, which in this case is my data downloaded in the proper format

y <- st_read("raw-data/ok_oklahoma_city_shapefiles/Police_Districts.shp") 
x <- read_rds("raw-data/oklahoma_city_rds.rds") 


#Here I do a little cleaning for my data by dropping na's, filtering for our two target divisions, and filtering for only Oklahoma plates
x2 <- x %>%
  drop_na() %>%
  filter(division %in% c("Santa Fe", "Springlake")) %>%
  filter(vehicle_registration_state == "OK")


#Now I write them in as rds files

write_rds(x2, path = "clean-data/x2")
write_rds(y, path = "clean-data/y")


#Time to delete away all the data I don't need anymore

dir_delete("raw-data/ok_oklahoma_city_shapefiles")
file_delete("raw-data/oklahoma_city.tgz")
file_delete("raw-data/oklahoma_city_rds.rds")
dir_delete("raw-data")

