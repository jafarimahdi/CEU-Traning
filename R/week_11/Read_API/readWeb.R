library(jsonlite)

# Read the currency form the web Api 
# API: 'https://exchangerate.host/#/:~:text=Bunch%20of%20API%20endpoints%20to%20Rock%20Your%20Business'

# --------------------------------------------
# Task-1 : show the amount of '1 Dollar & 1 Euro' to HUF ( Latest related )

data <- fromJSON('https://api.exchangerate.host/latest')


# show Forint to Euro 
data$rates$HUF

# show Dollar to Euro 
data$rates$USD


# ---------------------------- convert currency by using the API ( Convert Currency )

# convert Dollar to HUf  
convert_Dollar <- fromJSON('https://api.exchangerate.host/convert?from=USD&to=huf')
print(convert_Dollar)

# -----------

# convert Euro to HUf 
convert_Euro <- fromJSON('https://api.exchangerate.host/convert?from=EUR&to=huf')
print(convert_Euro)



# -------------------------------------------------------------------------------
# ----------------  show the chart of the HUF currency from jan23 to march23 by using data form API ( Time-series data )

library(data.table)
t<- fromJSON('https://api.exchangerate.host/timeseries?start_date=2022-01-01&end_date=2022-03-04&base=USD&symbols=HUF')
df <- rbindlist(t$rates)         # we add each rows by the rates with "rbindlist" method
df$date  <- names(t$rates).      # give a names to a column for all the rows
df$date  <- as.Date(df$date).    # make clear it's data and time format to the chart

# show in the chart
library(ggplot2)  
ggplot(df, aes(x=date, y=HUF))+
  geom_line()

# -----------------------------------------------------------






