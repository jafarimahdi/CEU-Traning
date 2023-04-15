library(rvest)
library(data.table)
library(jsonlite)
library(httr)
library(tidyverse)

# 1- input is url 
t <- read_html('https://www.payscale.com/research/US/Job=Product_Manager%2C_Software/Salary')

# 2- convert and get the data 
td  <- fromJSON(t %>% html_nodes(xpath = "//script[@type='application/json']") %>% html_text())

View(td)
result_as_json <- toJSON(td, auto_unbox = T) # to check in JsonViewer 
# add job title
# select
# name, profile count, salary, job title

# instaed of the column we should select the dataFrame to have all of them

location <- data.table(td$props$pageProps$pageData$byDimension$`Job by Location`$rows)

location_df <- location %>% select(name, profileCount, range)
location_df$jobTitle <-td$props$pageProps$careerPathData$value$jobTitle

