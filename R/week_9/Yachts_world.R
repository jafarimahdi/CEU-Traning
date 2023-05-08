library(rvest)
library(xml2)
library(data.table)
library(plyr)


# 1- get all the link by loop and save in one vector 
all_links <-c() # create a vector for collecting all the links

for (i in 2:5) {      # in each loop we check one page
  my_sec_links <- paste0("https://www.yachtworld.co.uk/boats-for-sale/?page=", i)
  
  t<-read_html(my_sec_links) 
  my_links <- t %>% html_node(".listings-container") %>% html_nodes("a") %>% html_attr("href")
  
  all_links <-c(all_links, my_links) # add to the empty vector each time in loop one more data from inner vector 
}
all_links # a vector of all the links 


 # ----------------------------------------
# step 2: we get data for each boat one by one from vector by link

get_yacht_word_ship <- function(t_url) {
  url <- read_html(t_url)
  
  # defined the list of the content 
  details <- list()
  details [["name"]] <- url %>% html_nodes(".heading") %>% html_text()
  details[["price"]] <- url %>% html_nodes(".payment-total") %>% html_text()
  
  
  # contact 
  key <- url %>%  html_nodes(".datatable-title") %>% html_text()
  
  value <- url %>%  html_nodes(".datatable-value") %>% html_text()
  
  if (length(key)==length(value)) {
    for (i in 1:length(key)) {
      print(paste0(key[i]," : ", value[i]))
      details[[ key[i] ]] <- value[i]
    }
  }
  return(details)
}

# ------------------------------------------------------------------

# step 3: make the data set from all the data we get from web and save it

my_new_list <- lapply(all_links, get_yacht_word_ship)  
new_data_set<- rbindlist(my_new_list,fill = T)








