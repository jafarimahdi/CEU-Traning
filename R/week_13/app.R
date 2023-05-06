library(shiny)
library(ggplot2)
library(data.table)
library(jsonlite)

getCoinPlot <- function(coin) {
  
  
  df <- data.table(fromJSON(paste0('https://api.coingecko.com/api/v3/coins/',coin,'/ohlc?vs_currency=usd&days=1'), simplifyDataFrame = T))
  
  names(df) <- c('time', 'open', 'high','low','close')
  
  #convert UNIX timestamp to date 
  df$time <- as.POSIXct((df$time/1000), origin="1970-01-01")
  
  result <- ggplot(df,aes(x=time, y=close))+
    geom_line()+
    theme_bw()
  
  return(result)
  #return(df)
}

ui <- fluidPage(
  
  selectInput("coin", "Select a coin",
              c('bitcoin', 'ethereum', 'ripple')),
  
  dataTableOutput('crypto_plot')  # plotOutpot
  
)

server <- function(input, output, session) {
  
  output$crypto_plot <-renderDataTable({ # renderPlot()
    getCoinPlot(input$coin)
  })
  
}

shinyApp(ui, server)