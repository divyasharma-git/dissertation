

install.packages("devtools")
install.packages("janitor")
install.packages("sf")
install.packages("sp")

devtools::install_github("PublicHealthDataGeek/CycleInfraLnd")

library(devtools)
library(CycleInfraLnd)
library(dplyr)
library(tidyverse)
library(janitor)
library(sf)
library(sp)
library(here)




###############################################################
# 1 | Data Loading

here::here

clt <- get_cid_lines(type = "cycle_lane_track") %>%
  st_transform(., 27700) %>% 
  clean_names()

poi <- readRDS(gzcon(url("https://npalomin.github.io/casa0005/seminar/poi.rds"))) %>%
  clean_names()

msoas <- st_read(here::here("data", "statistical-gis-boundaries-london", "ESRI", "MSOA_2011_London_gen_MHW.shp")) %>% 
  st_transform(., 27700) %>% 
  clean_names()


###############################################################
# 2 | Data Processing

# Format Cycling Infrastructure
clt <- clt %>%
  #dplyr::filter(clt_segreg == TRUE | clt_stepp == TRUE | clt_parseg == TRUE) %>% 
  mutate(length = st_length(clt$geometry))

clt <- st_join(clt, msoas, join = st_intersects)

clt_msoas <- clt %>% 
  group_by(msoa11cd) %>%
  summarise(length = sum(length))


# Format POI

poi <- st_join(poi, msoas, join = st_intersects)

poi_msoas <- poi %>% 
  dplyr::filter(is.na(msoa11cd) == FALSE,
                (groupname == "Education and Health" | groupname == "Retail" | groupname == "Transport" | groupname == "Attractions"))


# Export processed files
write.csv(clt_msoas, file = 'C:/Users/TBD/Documents/Education/UCL/Dissertation/TfL/data/clt_msoas.csv')
st_write(clt_msoas, 'C:/Users/TBD/Documents/Education/UCL/Dissertation/TfL/data/clt_msoas.shp')


write.csv(poi_msoas, file = 'C:/Users/TBD/Documents/Education/UCL/Dissertation/TfL/data/poi_msoas.csv')
write.csv(poi, file = 'C:/Users/TBD/Documents/Education/UCL/Dissertation/TfL/data/poi.csv')



### Unused Code
test <- poi %>%
  select distinct(groupname)

test <- distinct(poi, groupname)

poi %>% 
  st_drop_geometry() %>%
  dplyr::filter(is.na(msoa11cd) == FALSE, (groupname == "Attractions")) %>% 
  select(classname) %>%
  distinct