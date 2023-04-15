library(rvest)
library(package)
library(jsonlite)

# using 2 way to select data from html 

# 1- css selector
# 2- xpath selector for jason
# ---------------------------------------------------------------

    # 2A: first way : /ld+json
json_data <- 
  fromJSON(
    t %>%
      html_node(xpath = "//script[@type='application/ld+json']")%>%
      html_text()
  )


    # 2B: second way: /json
td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text()
)


