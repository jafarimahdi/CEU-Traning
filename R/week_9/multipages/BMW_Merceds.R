library(rvest)

# writing the function
# 2- get all the BMW cars
#url <- 'https://www.ultimatespecs.com/car-specs/BMW-models'
url <- 'https://www.ultimatespecs.com/car-specs/Mercedes-Benz-models'

# target the outer links
t <- read_html(url)
relative_link <- t %>% html_nodes('.home_models_line .col-md-3') %>% html_attr('href')

outer_link <- paste0('https://www.ultimatespecs.com', relative_link) # for each page of the car models

inner_link <- outer_link[1]

# reading_inner link for each model -- function ---------------------
read_inner <- function(inner_link) {
    
  read_inner <- read_html(inner_link)
  
  car_links <- read_inner %>% html_nodes('td a') %>% html_attr('href')
  
  final_relative_links <- car_links[startsWith(car_links,'/car')]
  
  # conncet each link to the base url 
  result <- paste0('https://www.ultimatespecs.com', final_relative_links)
  return(result)
}


# ----end of function 

# loop for combine the result of outer and inner link: base link and each car link 
read_all_link <- lapply(outer_link,read_inner)

# 4: push all the link to a single vector
myList <- unlist(read_all_link)

# delete the uncorect links from the vector 
myList[myList!="https://www.ultimatespecs.com"]

# resutl will be an list of the all vectors 
my_list





