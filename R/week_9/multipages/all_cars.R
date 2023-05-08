library(rvest)

url <- "https://www.ultimatespecs.com/car-specs"
t <- read_html(url) # read the general page, where you have all the cars

# select all the link for each car 
inner_page <- t %>% html_nodes('#car_make .col-md-3 a') %>% html_attr('href') 

# use gsub() method to delete '-model' from the end of car link
clean_inner_link <- gsub('-models','',inner_page)

all_link <- paste0('https://www.ultimatespecs.com',clean_inner_link)
view(all_link)

# -----------------

inner_page <- all_link[233]
read_inner_link <- function(inner_page) {
  print(inner_page)
# next2 steps: add the result of the inner link to the end of outer link and check each car webpage with past() method 
  t_link <- read_html(inner_page)
  
  #t <- read_html('https://www.ultimatespecs.com/car-specs/a-d-Tramontana')
  car_link <- t_link %>% html_nodes('.someOtherRow a') %>% html_attr('href')
  
  # we should filter cars, those end with .html 
  car_link <- car_link[endsWith(car_link,'.html')]
  
  
  # conncet each link to the base url 
  result <- paste0('https://www.ultimatespecs.com', car_link)
  return(result)
}

# loop all the links in function 
read_all_links <- lapply(all_link, read_inner_link)


# un List all the vector we receive from function 
all_cars_links <- unlist(read_all_links)


# in case of facing 404 error from server, do to send many request, 
# we should fetch and save all the data in first request 
# save the Data in RDS file in our local machine 
saveRDS(all_cars_links,'carLinks.rds')  




