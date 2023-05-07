library(ggplot2)
library(data.table)
library(jsonlite)
coin <- 'ethereum'

# -1 go to this website to get API: https://www.coingecko.com/en/api/documentation
# 2- in the "Coins" part find the "/coin/{id}/ohlc   Get coin's OHLC "
# 3- click on try it out and fill the places 
# 4- copy the API 


getCoinPlot <- function(coin) {
  
  df <- data.table(fromJSON(paste0('https://api.coingecko.com/api/v3/coins/',coin,'/ohlc?vs_currency=usd&days=1'), simplifyDataFrame = T))
  
  names(df) <- c('time', 'open', 'high','low','close')
  
  #convert UNIX timestamp to date 
  df$time <- as.POSIXct((df$time/1000), origin="1970-01-01") # Convert UNIX Timestamp to Date in R
  
 result <- ggplot(df,aes(x=time, y=close))+
    geom_line()+
    theme_bw()
 
  return(result)
}

p <- getCoinPlot('ethereum')

print(p)
