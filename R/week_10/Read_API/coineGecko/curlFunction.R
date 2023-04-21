library(jsonlite)
require(httr)
library(data.table)

CurlReader <- function(pageNum) {
    
  headers = c(
    `accept` = "application/json"
  )
  
  params = list(
    `vs_currency` = "usd",
    `order` = "market_cap_desc",
    `per_page` = "250",
    `page` = as.character(pageNum), # we should convert  user input to the string 
    `sparkline` = "false",
    `locale` = "en"
  )
  response <- httr::GET(url = "https://api.coingecko.com/api/v3/coins/markets", httr::add_headers(.headers=headers), query = params)
  
  # in case of facing 404 error for the request we should give time to try again for the request
  if (response$status_code == 429) {
    print("wait for 60 second and request agin ")
    Sys.sleep(60)
    CurlReader(pageNum) # we call again our function it named "Recursion" 
  }
  
  # convert the response as result to the json file
  as_a_json <- content(response,'text')
  
  # convert the result of one page as json to the data.fram file
  as_a_dataFrame <- fromJSON(as_a_json, flatten = TRUE) # for making the nested data.frame file we should use "flatten" function 

  return(as_a_dataFrame) # return data.fram file from 1 page
}

# call the function for 50 data.frame come from 50 pages in coinGecko.com and the result will be a List
list_of_dataFrames <- lapply(1:2, CurlReader)
str(list_of_dataFrames[[1]])
first_df <- list_of_dataFrames[[1]]

# combine all the data.fram files in list() to a new and one data.frame file
rbindlist(list_of_dataFrames)
str(dataFram_from_allPages)


# save all the result in local machine as RDS file 
saveRDS(dataFram_from_allPages,'coinGecko_data.rds')
