library(rvest)
library(data.table)

# in case of getting data in sending many request to website, facing 404 error, we should save data
# in .RDS format in our local machine once and be able to use it many times 
# read the RDS file
all_link <- readRDS('/Users/JM/greenFox/CEU-Traning/R/week_10/carLinks.rds')


get_car_details <- function(url) {
  
  print(url)
  
  #car_link <- all_link[13]  for only 1 car
  
  car_data <- read_html(url)
  
  # define a list and add data in it
  cars_details <- list()
  
  # add the name of the car as title, on the top of the list()
  cars_details[['name']] <- car_data %>% html_nodes('.page_ficha_title_text span') %>% html_text()
  
  # read the other data in table for cars details
  key <- car_data %>% html_nodes('.tabletd') %>% html_text() %>% trimws() # trimws delete the end of the file 
  value <-car_data %>% html_nodes('.tabletd_right') %>% html_text() %>% trimws()
  
  
  # check if the length are equals to merge the keys and values 
  if(length(key)==length(value)){
    for (i in 1:length(key)) {
      cars_details[[key[i]]] <- value[i]
    }
  }
  return(cars_details)
    
}

get_car_details(all_link[800])

car_list <- lapply(all_link[1:30], get_car_details)

# convert list to data frame and solve the rows problem with "fill = T" to set in the data.frame file
car_df <- rbindlist(car_list, fill = T)

view(car_df) # the file is a data.frame table now



