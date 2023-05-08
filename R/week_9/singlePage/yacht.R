library(rvest)
library(xml2)
  
# 1- read_html( url )
# 2- html_nodes( tag ) 
# 3- html_text('a' )  or html_attr('href')
# 4- define name, price, builtBy in variable
# 5- push all the variable to the LIST
# 6- show the result by loop or return the list 

  # ------------------------------------

webScraping <- function(url) {

  details <- read_html(url)  # 1 step: link the website
  
  name <- details %>% html_nodes(".heading--large") %>% html_text()
  name <- gsub('for sale','',name)
  
  price_built <- details %>% html_nodes(".stats__heading span") %>% html_text()
  builtBy <- price_built[1]
  price <- price_built[2]
  
  # making a LIST from Data for result as LIST
  data_details <- list()
  
  data_details [["name"]] <- name
  data_details[["price"]]<- price
  data_details[["builtBy"]] <-builtBy
  
  
  data_details$name
  for (item in data_details) {
    print(data_details$item)
  }
  
  # or return the data
  #return (data_details)
}

url <- "https://www.boatinternational.com/yachts-for-sale/fortitude-intermarine-usa-1998"

webScraping(url)
