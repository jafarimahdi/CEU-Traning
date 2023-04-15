library(rvest)
library(data.table)
library(jsonlite)
library(httr)
library(tidyverse)

# How to read json file from Url 

# 1- reading a website
t <- read_html('https://www.payscale.com/research/US/Job=Product_Manager%2C_Software/Salary') 

# 2-get result as a List of data from website 
td  <- fromJSON(t %>% html_nodes(xpath = "//script[@type='application/json']")%>% html_text())


# 3- convert the result "List" back to the JSON format file
toJSON(td,auto_unbox = T) # auto_unbox 


# 4-  for checking easier the target data and location you want to result  
# put the JSON in the online "Json Viewer" website 


# 5- select the target data in Rstudio 
td$props$pageProps$pageData$byDimension
