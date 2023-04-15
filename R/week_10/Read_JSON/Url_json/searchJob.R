library(rvest)
library(data.table)
library(jsonlite)
library(httr)
library(tidyverse)

# 1- input is url 
t <- read_html('https://www.payscale.com/research/US/Job')

td  <- fromJSON(t %>% html_nodes(xpath = "//script[@type='application/json']") %>% html_text())

View(td)
result_as_json <- toJSON(td, auto_unbox = T) # to check in JsonViewer

job_title <- data.frame(td$props$pageProps$pageData$secondaryItems$text)
job_url <- data.frame(td$props$pageProps$pageData$secondaryItems$url) 


result <- cbind(job_title, job_url)

