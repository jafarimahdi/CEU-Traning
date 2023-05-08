# The midterm project is that you have to scrape all the Kawasaki motor data.
# https://www.motorcycle.com/specs/kawasaki.html

library(rvest)
library(data.table)

# 1 get all the link. save it
vector_of_all_links <- c()

# we target from page1-3 for reload and work faster
for (pageNum in 1:3) {
    
  url <- paste0("https://www.motorcycle.com/specs/kawasaki.html?page_num=", pageNum)
  t <- read_html(url)
  relative_link <- t %>% html_nodes('.flex-one a') %>% html_attr('href')
  
  relative_link <- gsub('#UserReviews','',relative_link)
  
  vector_of_all_links <- append( vector_of_all_links, relative_link)
}
one_link <- vector_of_all_links[1] # check the link will be correct 

# ---------------------------
# 2- create a function that takes one link, and return with a list, 
# which contain all the data of the motor.

get_motors_details <- function(url) {
  
  motor_data <- read_html(paste0('https://www.motorcycle.com',url))
  
  motor_details <- list()
  
  motor_details[["name"]] <- motor_data %>% html_nodes('.sl-post-title') %>% html_text()
  key <- motor_data %>% html_nodes('.spec-key.bold') %>% html_text() %>% trimws()
  value <- motor_data %>% html_nodes('.vs-specs-table-row .spec-value') %>% html_text() %>% trimws()
  
  if(length(key)==length(value)){
    for (i in 1:length(key)) {
      motor_details[[key[i]]] <- value[i]
    }
  }
    return(motor_details)
}

# -----------------------
# 3- lapply your function to all your links, rbindlist. save the data.
# we target the first 30 data from List() to reload faster 
read_all_links <- lapply(vector_of_all_links, get_motors_details)

# convert to data.frame
motors_df <- rbindlist(read_all_links, fill = T)
View(motors_df)

# make RDS file
saveRDS(motors_df,'motors_data.rds')

# ------------------------------
# 4 make an rmd report with some ggplot and exploratory data analytics,
 # motors.Rmd created

# 5 post your finding to rpubs

# please send me the result with the data in rds format, the rmd, and also the link to your publication.
# The deadline is Friday 23:59!

