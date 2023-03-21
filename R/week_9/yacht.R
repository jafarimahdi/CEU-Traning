library(rvest)
library(xml2)
# web scraping with "rvest" package 


t <- read_html('https://www.boatinternational.com/yachts-for-sale') # read the html file


# t %>% html_nodes(".card__title--sponsored a") %>% html_text().          # for adding all the data  
all <-t %>% html_nodes(".card__title--sponsored a") %>% html_attr("href") # for reading only the links
links <- paste0("https://www.boatinternational.com",all)

links


#url <-"https://www.boatinternational.com/yachts-for-sale/emocean-rosetti-2021" for chacking spacific yacht 

# -----------------------------------------
# -----------------------------------------


first_function <- function(userUrl) {
  
  
  yacht <- read_html(userUrl) # 1 step: link the website
  
  
  # name
  name <- yacht %>% html_nodes(".heading--large") %>% html_text()
  name<- gsub('for sale','',name)
  name
  # price 
  price_yacht <- yacht %>% html_nodes(".stats__heading span") %>% html_text()
  builtBy <- price_yacht[1]
  price <- price_yacht[2]
  builtBy
  price
  
  
  data <- data.frame("Yacht Name"= name,"Built By"=builtBy ,"Price"= price,"url"= url)
  data
  return(data) # my data is ready from the web 
}


data_set2 <- data.frame()


for (item in links) {
  data_set <-first_function(item)
  data_set2 <- rbind(data, data_set)
}














