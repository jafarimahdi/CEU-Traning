library(rvest)
library(dplyr)

link <-'https://www.imdb.com/search/title/?title_type=feature' 

# ---------------- First step: read the URL
page <- read_html(link)

# -------------- Second step:  define variables 

name <- page %>% html_nodes(".lister-item-header a") %>% html_text()
year <- page %>% html_nodes(".text-muted.unbold") %>% html_text()
metaScore <- page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
duration <- page %>% html_nodes(".runtime") %>% html_text()
gener <- page %>% html_nodes(".genre") %>% html_text()

# ------- third step: push to DataFrame , Facing Error = arguments imply differing number of rows: 50, 43, 45

movies_dataFrame <- data.frame(name,year,metaScore,duration,gener, stringsAsFactors = FALSE)


# ----- third step: push data to List
movies_list <- list()

movies_list[["name"]] <- name
movies_list[["year"]] <- year
movies_list[["metaScore"]] <- metaScore
movies_list[["duration"]] <- duration
movies_list[["gener"]] <- gener


# convert a LIST to DATAFRAME file
convert_list <- rbind(movies_list). # combine in 1 row
convert_list_1 <- cbind(movies_list) # combine in 1 column 
