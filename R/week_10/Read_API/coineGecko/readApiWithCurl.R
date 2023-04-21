library(jsonlite)
require(httr)
# reading API with "Curl" in "curlconverter.com" website 

headers = c(
  `accept` = "application/json"
)

params = list(
  `vs_currency` = "usd",
  `order` = "market_cap_desc",
  `per_page` = "100",
  `page` = "1",
  `sparkline` = "false",
  `locale` = "en"
)

res <- httr::GET(url = "https://api.coingecko.com/api/v3/coins/markets", httr::add_headers(.headers=headers), query = params)
class(res)

# -----------------------------------------------
# getting out the data of "res" after reading API and convert it to able able for using the data in R -------

# convert the response as result to the json file
convertToJson <- content(res,'text')
class(convertToJson)

# convert the result as json to the data.fram file
convertToDataframe <- fromJSON(convertToJson)
class(convertToDataframe)


