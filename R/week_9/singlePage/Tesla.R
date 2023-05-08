t <- read_html('https://www.ultimatespecs.com/car-specs/Tesla')
linkek <- t %>% html_nodes('.someOtherRow a') %>% html_attr('href')

links <- paste0('https://www.ultimatespecs.com',linkek[endsWith(linkek, '.html')])

get_one_car_details <- function(url) {
  #Sys.sleep(sample(10:30, 1))
  print(url)
  t_list <- list()
  
  t <- read_html(url)
  t_list[['name']] <- t %>% html_node('h1') %>% html_text()
  t_list[['link']] <- url
  
  
  keys <- t %>% html_nodes('.tabletd') %>% html_text()
  keys<- trimws(gsub(':', '', keys, fixed = T))
  
  values <- t %>% html_nodes('.tabletd_right') %>% html_text()
  values <- trimws(values)
  
  if (length(keys)==length(values)) {
    for (i in 1:length(keys)) {
      t_list[[keys[i]]] <- values[i]
    }
  }
  return(t_list)
  
}

# if it runs to error, that means that you have to many request
t <- get_one_car_details('https://www.ultimatespecs.com/car-specs/Tesla/106267/Tesla-Model-S-70.html')

str(t)

df <- rbindlist(lapply(links[1:5], get_one_car_details), fill = T)

saveRDS(df, 'TSLAcars.rds')
head(df,1)