# using "nycflights13" package 
library(nycflights13)
library(dplyr)

# how to check the list of data inside of package 
nycflights13::airlines

# how to view the tables of data-set in Environment  
View(nycflights13:airlines )
airlines <- nycflights13::airlines # show the airlines table in data-set 
airports  <- nycflights13::airports # show the airports table in data-set
flights <- nycflights13::flights # show the flights table in data-set
planes <- nycflights13::planes # show the plans table in data-set
weather <- nycflights13::weather # show the weather table in data-set


# task -1: show the flights in January with dep_delay bigger 10 and show how many flights has in the data with this filter 

flights %>% 
  filter(month == 1 & dep_delay >10) %>% 
  summarise(number_of_orvesation <- n())  # n() method show the amount of the rows this filter has now


# task -2: A) what is the average arrivil delayed from LGA origin 
#          B)- how many flights it has 
#          C)- what was the maximum delay 
  
flights %>% 
  filter( origin == "LGA") %>%  # first step to filter 
  summarise(amount_of = n(), mean(arr_delay, na.rm = T), max(arr_delay, na.rm = T)) # secound step for other condition 


# task -3 A) which plane was the most exact in time where the come from "EWR" or "JFK" origin

df<-   # make new view for my table result to check
flights %>% 
  filter(origin == "EWR" | origin == "JFK") %>% # first to filter
  group_by(tailnum) %>%  # second to group each plan by them tailnum
  summarise(avrege_delay= mean(arr_delay ,na.rm = T)) %>%  # third to check 
  arrange(avrege_delay) %>% # forth sort the data
  mutate(abs_avrege = abs(avrege_delay)) %>% # make new column 
  arrange(abs_avrege) %>% # sort the data
  head(1) # show the first one 

  


