# install.packages('nycflights13')
library(ggplot2)
library(nycflights13)
library( tidyverse )
library(reader)
library(data.table)
library(dplyr)

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

check_flights <- nycflights13::flights
check_flights %>% 
  filter(dep_delay > 500 & dest == "MIA" & carrier %in% c("EV","AA","US") )










