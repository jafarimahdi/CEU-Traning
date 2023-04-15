library(rvest)
library(data.table)
library(jsonlite)
library(httr)
library(tidyverse)
library(ggplot2)

t <- read_html('https://www.payscale.com/research/US/Software_Developer/Salary')

td  <- fromJSON(t %>% html_nodes(xpath = "//script[@type='application/json']") %>% html_text())

jsonView <- toJSON(td, auto_unbox = T)

softwareDev <- td$props$pageProps$pageData$byDimension$`Job by Employer`$rows


softwareDev %>% ggplot(aes(x=name,y=profileCount))+ 
  geom_bar()
