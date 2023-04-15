library(rvest)
library(xml2)

yacht_details <- function(userUrl) {
  yacht <- read_html(userUrl) # 1 step: read the link of the website
  
  # 2: define name
  name <- yacht %>% html_nodes(".heading--large") %>% html_text()
  name<- gsub('for sale','',name)
  
  # 2: define price & built 
  price_built <- yacht %>% html_nodes(".stats__heading span") %>% html_text()
  builtBy <- price_built[1]
  price <- price_built[2]
  builtBy
  price
  
  # 3:  push all the data to a DATAFRAME file for result 
  data <- data.frame("Yacht Name"= name,"Built By"=builtBy ,"Price"= price,"url"= url)
  data
  return(data) # my data is ready from the web 
}


url <- read_html('https://www.boatinternational.com/yachts-for-sale')             # read the html file
  all_tags <-url %>% html_nodes(".card__title--sponsored a") %>% html_attr("href")    # for reading only the links
  conect_links <- paste0("https://www.boatinternational.com",all_tags)
  conect_links


# ---------------
result <- data.frame()

for (item in conect_links) {
  data_set <- yacht_details(item)
  result <- rbind(data, data_set) 
}





