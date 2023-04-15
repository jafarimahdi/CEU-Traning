library(rvest)
library(data.table)
library(jsonlite)
library(httr)
library(tidyverse)


get_loc_salary <- function(inputUrl) {
  
  t <- read_html(inputUrl)
  td  <- fromJSON(t %>% html_nodes(xpath = "//script[@type='application/json']") %>% html_text())
  
  location <- data.table(td$props$pageProps$pageData$byDimension$`Job by Location`$rows)
  
  location_df <- location %>% select(name, profileCount, range)
  location_df$jobTitle <-td$props$pageProps$careerPathData$value$jobTitle
 
  return(location_df) 
}

get_loc_salary('https://www.payscale.com/research/US/Job=Software_Developer/Salary')
get_loc_salary('https://www.payscale.com/research/US/Job=Data_Scientist/Salary')
