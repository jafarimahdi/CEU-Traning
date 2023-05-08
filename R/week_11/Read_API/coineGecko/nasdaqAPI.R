
# url: https://www.nasdaq.com/market-activity/stocks/screener

require(httr)

headers = c(
  `authority` = "api.nasdaq.com",
  `accept` = "application/json, text/plain, */*",
  `accept-language` = "en-US,en;q=0.9",
  `origin` = "https://www.nasdaq.com",
  `referer` = "https://www.nasdaq.com/",
  `sec-ch-ua` = '"Chromium";v="112", "Google Chrome";v="112", "Not:A-Brand";v="99"',
  `sec-ch-ua-mobile` = "?0",
  `sec-ch-ua-platform` = '"macOS"',
  `sec-fetch-dest` = "empty",
  `sec-fetch-mode` = "cors",
  `sec-fetch-site` = "same-site",
  `user-agent` = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"
)

params = list(
  `tableonly` = "true",
  `limit` = "25",
  `offset` = "25"
)

res <- httr::GET(url = "https://api.nasdaq.com/api/screener/stocks", httr::add_headers(.headers=headers), query = params)

# convert the reponse to the list 
convert_to_list <-fromJSON(content(res, 'text'))

# target the rows in the  list file
df <- convert_to_list$data$table$rows
