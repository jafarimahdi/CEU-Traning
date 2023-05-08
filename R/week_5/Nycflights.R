# install.packages('nycflights13')
library(ggplot2)
library(nycflights13)
library( tidyverse )
library(reader)
library(data.table)


# getwd(). : check your local work directory 
# setwd()    set your wrok directory 


# -if you have file in the same path and faced error to find, just switch the work directory
   # in R-studio :a)-go to session b)-Set working directory c)-chose directory d)- select the path


#  Task-1: read.delim() for the .txt file

diamonds_txt <- read.delim("diamonds.txt", header = TRUE, sep = "#")
head(diamonds_txt)

# Task-2: read.csv() for the .csv file

diamonds_csv <- read.csv("diamonds.csv",header = TRUE, sep = ";")
head(diamonds_csv)

# Task:-3: read the data-set .txt file with the extra line

#diamonds_with_extra_lines <- read.delim("diamonds_with_extra_lines.txt", sep = ";", skip = 1)
diamonds_with_extra_lines <- read.csv("diamonds_with_extra_lines.txt", sep = ";", skip = 1)
View(head(diamonds_with_extra_lines))



# Task-4: read the data-set file from URL

web_url <-'https://raw.githubusercontent.com/CEU-Economics-and-Business/ECBS-5208-Coding-1-Business-Analytics/master/class_2/data/hotels/clean/my_csvfile.csv'
reading_from_url <- read.csv(web_url)
#reading_from_url <- read_csv(web_url)
#reading_from_url <- data.table(web_url)
View(head(reading_from_url))


# Task-5: Filter the flights data where departure delays was over 1000.

flights <- nycflights13::flights
flights %>% 
  filter(dep_delay > 1000)


# Task-6:  Filter the flights data where departure delays was over 500 and destination was MIA and carrier either EV, AA, US .
# Task-7: Merge the result with the airlines datasets.
library(dplyr)
check_flights <- nycflights13::flights
check_flights %>% 
  filter(dep_delay > 500 & dest == "MIA" & carrier %in% c("EV","AA","US")) %>% 
  
#merge_tables <- merge(check_flights, airlines,by.x='carrier', by.y = 'carrier') return wrong answer and not able to define a variable 
#View(merge_tables)

merge(check_flights, airlines,by.x='carrier', by.y = 'carrier')


# Write out the result into

#.  write into a csv file without rownames
write.csv(check_flights, "/Users/JM/greenFox/CEU-Traning/R/R_Traning/check_flights.csv", row.names = F)

# write into an excel file
install.packages("xlsx")
library("xlsx")
write.xlsx(check_flights,  "/Users/JM/greenFox/CEU-Traning/R/R_Traning/work-book1.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

  
# write into a rds file


# mutate(): create a new column 
# cbind(): conect the cells of columns to one, it must have the same length and data type  

# Create a new column in the flights dataset of the first three column which will be a string like 2015-01-15

new_flight <- flights

new_flight$new_col = paste(new_flight$year, "-", new_flight$month,"-", new_flight$day)  
  
new_flight %>% 
  select(year, month, day, new_col)    



# Task -8: Change it to date column

new_flight$new_col <- as.Date(new_flight$new_col)
new_flight %>% 
  select(c('year', 'month', 'day', 'new_col')) %>% 
  head()


# Create a new column `delays` which will indicate the delays, sum of absulute values of two delays 

new_flight$delays <- abs(new_flight$dep_delay)+ abs(new_flight$arr_delay)
new_flight %>% 
  select(c('year', 'month', 'day', 'dep_delay', 'arr_delay', 'delays')) %>% 
  head()



# What is the carrier name of the flights which had the most departure delay. 
#merge(flights[which.max(flights$dep_delay),], airlines, by.x = 'carrier', by.y = 'carrier') %>% select('name')














