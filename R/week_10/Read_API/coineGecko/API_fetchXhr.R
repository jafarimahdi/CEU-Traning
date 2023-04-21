# Tracking the TradingView  data website wit ftech/Xhr

# in case of using API, we can check the website same as HTML target, and get json, 
# but get the data form 'fetch/xhr' instead on 'network'
# section and 
require(httr)
library(data.table)

cookies = c(
  `cookiesSettings` = '{"analytics":true,"advertising":true}',
  `cookiePrivacyPreferenceBannerProduction` = "accepted",
  `_sp_ses.cf1a` = "*",
  `_sp_id.cf1a` = "32a20731-a951-4686-afbc-bd27ad6c69f2.1619626652.291.1681811086.1647017175.2ff8db3f-4577-4713-bd11-cd9d7d781725"
)

headers = c(
  `authority` = "scanner.tradingview.com",
  `accept` = "text/plain, */*; q=0.01",
  `accept-language` = "en-US,en;q=0.9,fa;q=0.8,hu;q=0.7",
  `content-type` = "application/x-www-form-urlencoded; charset=UTF-8",
  `origin` = "https://www.tradingview.com",
  `referer` = "https://www.tradingview.com/",
  `sec-ch-ua` = '"Chromium";v="112", "Google Chrome";v="112", "Not:A-Brand";v="99"',
  `sec-ch-ua-mobile` = "?0",
  `sec-ch-ua-platform` = '"macOS"',
  `sec-fetch-dest` = "empty",
  `sec-fetch-mode` = "cors",
  `sec-fetch-site` = "same-site",
  `sec-gpc` = "1",
  `user-agent` = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"
)

data = '{"filter":[{"left":"type","operation":"in_range","right":["stock","dr","fund"]},{"left":"subtype","operation":"in_range","right":["common","foreign-issuer","","etf","etf,odd","etf,otc","etf,cfd"]},{"left":"exchange","operation":"in_range","right":["AMEX","NASDAQ","NYSE"]},{"left":"is_primary","operation":"equal","right":true},{"left":"active_symbol","operation":"equal","right":true}],"options":{"lang":"en"},"markets":["america"],"symbols":{"query":{"types":[]},"tickers":[]},"columns":["logoid","name","close","change","change_abs","Recommend.All","volume","Value.Traded","market_cap_basic","price_earnings_ttm","earnings_per_share_basic_ttm","number_of_employees","sector","description","type","subtype","update_mode","pricescale","minmov","fractional","minmove2","currency","fundamental_currency_code"],"sort":{"sortBy":"market_cap_basic","sortOrder":"desc"},"range":[0,150]}'

res <- httr::POST(url = "https://scanner.tradingview.com/america/scan", httr::add_headers(.headers=headers), httr::set_cookies(.cookies = cookies), body = data)

# change thethe data type 
convert_to_Json <- content(res,'text')

# to the data.fram
convert_to_list <-fromJSON(convert_to_Json, flatten = TRUE)


convert_to_dataFrame <- rbindlist(convert_to_list)

