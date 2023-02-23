library(dplyr)
library(nycflights13)

# Task-1: What is the name of the airport(not the id) 
#      which was the most visited destination from June to September?

flights <- nycflights13::flights


most_visited <-
  flights %>% 
  filter(!is.na(tailnum)) %>%           # is.na() to recognize the data is Nan
  filter(month > 5 & month< 10) %>%     # June to September 
  group_by(dest) %>%                    # group by dest 
  summarise(most_visited = n()) %>%     # give to each group the value by the time repetition 
  arrange(-most_visited) %>%            # to find the max num in each group
  head(1)
  
most_visited
airports %>%                                                         # select the secound table 
  merge(x = most_visited, y= airports, by.x='dest', by.y='faa') %>%  # merge two tables together
  select(name)                                                       # select the column to show


#    -----------------------------

#  Task-2: What was the average temperature in the EWR airport
#         in June by year(every year June average temperature)?
 
avg_temp<-
  weather %>% 
  filter(origin == 'EWR') %>%                           # filter by EWR in origin column
  filter(month == 5) %>%                                # filter by June
 # group_by(month == 5) %>%                             # group by each year
  summarise(avg_temp = mean(temp, na.rm = T)) # %>%     # to find the average in June
  
  #select(year, month, avg_temp)
  
print(avg_temp)


#.  -----------------------------

# Task-3:  How many engines has the plane who made the JFK to MIA distance the fastest on average?

fast_average <-
  flights %>% 
  filter(origin == 'JFK' & dest == 'MIA') %>%                     # JFK to MIA
  group_by(tailnum) %>%                                           # tailnum
  summarise(fast_average = mean(air_time, na.rm = T)) %>%         # find the average 
  arrange(fast_average, .by_group = TRUE)   %>%                   #sort to find min in group
  head(1)        
  
fast_average
planes %>%                                                                        # second table
  merge(x = fast_average , y = planes, by.x = 'tailnum', by.y = 'tailnum') %>%    # merge by column names 
  select(tailnum, fast_average, engines )                                         # select columns to show 



# Task-4 find the name and model of the plane, that had the most fly in February 


most_flight <-
  flights %>% 
  filter(month == 2) %>% 
  
  
  








