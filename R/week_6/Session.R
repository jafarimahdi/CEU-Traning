library(nycflights13)

# Task-1:  which airplane was in the air for the most time
flights %>% 
  group_by(tailnum) %>% 
  summarise(in_air = sum(air_time, na.rm = T)) %>%  # summarise is important method on dplyr package 
  arrange(-in_air) %>% 
  head(1)
 
# Task-2: what is the name of company, that have the most arrival dely "arr_dely" in average in August 

  !# 1- filter agoust
  # 2- group by company
  # 3 - find the average of delay of each company
  # 4- Arrange or sort of the result and find the most big number 
  # 5- find the match of the two table by the carrier name in other table 
  # 6- merge them to find the match 
  # 7- select the name we need 

most_late <-
flights %>% 
  filter(month == 8) %>% 
  group_by(carrier) %>% 
  summarise(av_dely = mean(arr_delay, na.rm = T)) %>% 
  arrange(-av_dely) %>%
  head(1)

most_late
airlines %>% 
  merge(x = most_late, y = airlines, by.x = "carrier", by.y = "carrier") %>% 
  select(name)
  
  
  
# Task-3: Who is the manufacturer of the flights that flow the most times from EWR and how much times it flow?

find_the_most <-
flights %>% 
  filter(!is.na(tailnum)) %>%   # is.na() to recognise the data is Nan
  filter(origin == "EWR") %>% 
  group_by(tailnum) %>% 
  summarise(find_the_most = n())%>% 
  arrange(-find_the_most) %>% 
  head(1)

find_the_most
planes %>%   
merge(x = find_the_most, y = planes, by.x="tailnum", by.y="tailnum") %>% 
  select(tailnum, find_the_most, manufacturer)

  
# Task-4: How many seats does the airplane have which flow the most times from JFK to MCO?
most_set <-
  flights %>% 
  filter(origin == "JFK" & dest == "MCO") %>% 
  group_by(tailnum) %>% 
  summarise(most_set =n()) %>% 
  arrange(-most_set) %>% 
  head(1)

most_set
planes %>%   
  merge(x = most_set, y = planes, by.x="tailnum", by.y="tailnum") %>% 
  select(manufacturer, model, seats)



  


  