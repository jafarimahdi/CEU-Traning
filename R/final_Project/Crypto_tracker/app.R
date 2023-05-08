library(shiny)
library(ggplot2)
library(data.table)
library(jsonlite)
library(rsconnect)
library(plotly)
library(shinythemes)
library(shinydashboard)


# 1- returning the data.Frame in the result
get_coin_df <- function(coin, coin_days) {
  df <- data.table(fromJSON(paste0('https://api.coingecko.com/api/v3/coins/',coin,'/ohlc?vs_currency=usd&days=',coin_days), simplifyDataFrame = T))
  
  names(df) <- c('time', 'open', 'high','low','close')
  
  #convert UNIX timestamp to date 
  df$time <- as.POSIXct((df$time/1000), origin="1970-01-01")
  
  return(df)
}

# 2- showing the plot by getting the id
getCoinPlot <- function(coin_df) {
  
  result <- ggplot(coin_df,aes(x=time, y=close))+
    geom_line()+
    theme_bw()
  
  return(result)
}


# get the first 100 coin as list in the function 
get_coin_list <- function() {
  list <- fromJSON("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")
  
  list <- list[c('id','name')]
  
  return(list)
}


# -----------UI in shinny app ------------------------------
# R UI: navbarPage, fluidPage, simplePage, dashboard boday are in same level

ui <- fluidPage(theme = shinytheme("slate"),
                titlePanel('Crypto Tracker'), 
                    sidebarLayout(
                        sidebarPanel(
                          # show the first 100 coin as drop Down
                          uiOutput('show_coin'),
                          # show drop Down for selecting the date
                          uiOutput('show_date'),
                        ),
                        mainPanel(
                          tabsetPanel(
                            # for showing just plot got data from the two drop down in server part
                           tabPanel("Chart", plotOutput('crypto_plot',width = '100%', height='600px')),  
                            # show the table of all coines  
                            tabPanel("Data Table",tableOutput('new_table_out')),
                                     )
                        )
                )
            )


server <- function(input, output, session) {
  
  # 1- call the function to get data.Frame
  coin_list <- get_coin_list()
  
  # 2-  creating reactive variable for all 
  actuall_coin <- reactive({ get_coin_df(input$coin, input$coin_days)})
  
  # ---- Outputs >>>
  
  # output for show_coin as drop down 
  output$show_coin <- renderUI({ selectInput("coin", "Select a coin",
                                             setNames(coin_list$id, coin_list$name),selected = 'bitcoin')
  })
  
  # output for selecting Day in drop Down
  output$show_date <- renderUI({ selectInput("coin_days", "Select the time",
                                             c('Day' ='1','Week'='7','2_Weeks'='14','Month'='30','3_Months'='90','6_Months'='180','1_Year'='365','All Time'='max'),selected = '1')
  })
  
  
  # returning the new_table_out as list of all the coin 
  output$new_table_out <- renderTable({ actuall_coin()})
  
  
  # returning the plot to show
  output$crypto_plot <- renderPlot({ getCoinPlot(actuall_coin())})
}

shinyApp(ui, server)