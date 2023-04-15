library(rvest)
library(xml2)
library(data.table)
library(plyr)

# first step to get details for a yacht 

  get_yacht_word_ship <- function(t_url) {
  url <- read_html(t_url)
    
  # defined a LIST for the content & add name and price
  details <- list()
  
  details [["name"]] <- url %>% html_nodes(".heading") %>% html_text()
  details[["price"]] <- url %>% html_nodes(".payment-total") %>% html_text()
  
  
  # content 
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


# get 3 link from web site manually 

list_of_yacht <- c("https://www.yachtworld.co.uk/yacht/2005-nautor-swan-82--103-8741683/", 
                   "https://www.yachtworld.co.uk/yacht/2020-bavaria-s36-open-8508362/",
                   "https://www.yachtworld.co.uk/yacht/2022-princess-y72-8535007/")


# ------- collect the data from the link we receive and convert to data-set 

# first way to collect the 
all_df <- data.frame()
for (item in list_of_yacht) {
 df <- data.frame(get_yacht_word_ship(item))
 all_df <-rbind.fill(all_df, df) # combain to data frame to one for better management 
}

# secound way
my_list <- lapply(list_of_yacht, get_yacht_word_ship)  
ships<- rbindlist(my_list,fill = T)



#-------------------------------------------------------------------------------

# example of the lapply methods to use  ----------------
# adding the links to the functions 
at2 <- function(x) {
  x +2
}
lapply(1:10, at2) # short hand of using for loop in R programming 


 


