library(rvest)
library(package)

# read all the tables in the webpages/HTML

t <- read_html('https://www.yachtworld.co.uk/yacht/1989-palmer-johnson-motorsailer-8587552/')
t %>% html_table()

all <- rbindlist(t %>% html_table())
all <- all[!duplicated(all)]

df <- data.table(all %>% pivot_wider(names_from = X1, values_from = X2))

df
