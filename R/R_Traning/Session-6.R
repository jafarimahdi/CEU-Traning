# using "nycflights13" package & data-set
library(nycflights13)
library(dplyr)

# how to check the list of data inside of data-set and table 
# data-set_name :: table

nycflights13::airlines

# how to view/show the tables of data-set in Environment  
# define the variable for each table 

View(nycflights13:airlines )
airlines <- nycflights13::airlines # show the airlines table in nycflights13 data-set 
airports <- nycflights13::airports # show the airports table in nycflights13 data-set
flights <- nycflights13::flights # show the flights table in nycflights13 data-set
planes <- nycflights13::planes # show the plans table in nycflights13 data-set
weather <- nycflights13::weather # show the weather table in nycflights13 data-set


# task-1:A) show the flights in January with dep_delay that's bigger than 10 
#.       B) and amount of these flights

flights %>% 
  filter(month == 1 & dep_delay >10) %>% 
  summarise(number_of_orvesation <- n())  # n() method show the amount of the rows in this filter


# task-2: A) what is the average arrival delayed from "LGA" origin 
#         B)- how many flights it has 
#         C)- what was the maximum delay 
  
flights %>% 
  filter( origin == "LGA") %>%  # first step for filter 
  summarise(amount_of = n(), mean(arr_delay, na.rm = T), max(arr_delay, na.rm = T)) # second step for Number of row, Average, find the Max 


# task-3 A) which plane was the most exact in time 
#           where they come from "EWR" or "JFK" origin

df<-           # define variable as new table to have better view for result to check
flights %>% 
  filter(origin == "EWR" | origin == "JFK")%>%            # 1-step: filter
  group_by(tailnum)%>%                                    # 2-step: group each plan by them tailnum
  summarise(avrege_delay= mean(arr_delay ,na.rm = T))%>%  # 3-step: find Average and defined to variable, and summarise it 
  arrange(avrege_delay)%>%                                # 4-step: sort the data
  mutate(abs_avrege = abs(avrege_delay))%>%               # 5-step: define new column to the table
  arrange(abs_avrege)%>%                                  # 6-step: sort that column
  head(1)                                                 # 7-step: grab the first one 

  


