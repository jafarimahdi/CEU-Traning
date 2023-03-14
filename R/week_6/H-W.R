library(ggplot2)
library(dplyr)
library(nycflights13)

flights <- nycflights13::flights
planes <- nycflights13::planes
airplanes <- nycflights13::airlines


# Task-1:  How many seats has the airplane which flow the most times from JFK to MCO?
plane_seats <- flights %>% 
  filter(origin == "JFK" & dest == "MCO") %>% 
  group_by(tailnum) %>% 
  summarise(tailnum = tailnum, flight_time = n()) %>% 
  arrange(desc(flight_time)) %>% 
  head(1)
  
plane_seats <-
  merge(x = plane_seats, y =planes, by.x = "tailnum", by.y ="tailnum") %>% 
  select(tailnum, seats, flight_time)

plane_seats
#    tailnum seats flight_time
# 1  N562JB   200          48
  

# Task-2: The best carriers based on arriving (on average the arr_delay is the least), 
# colors= limegreen and cyan4

best_arrive <-
  flights %>% 
  group_by(carrier) %>% 
  summarise(best_arrive =mean(arr_delay, na.rm = T)) %>% 
  arrange(best_arrive)

best_arrive

ggplot(best_arrive,aes(x= reorder(carrier,best_arrive), y= best_arrive))+
  geom_col(fill='cyan4',color="limegreen")+
  labs(x ="Avrage on delay", y = "carirr",
       title = "Avrage delay")+                 
  theme_linedraw()



# Task-3: Average arrival delay by destinations name in August

delay_arrive <-
  flights %>% 
  filter(month == 8) %>%  # filter in the august 
  group_by(dest) %>%  # group by dest
  summarise(delay_arrive = mean(arr_delay, na.rm = T)) %>% 
  arrange(delay_arrive) %>% 
  head(10)

View(delay_arrive)

# merge with another table to find the name
dest_name <-merge(x= delay_arrive, y = airports, by.x = "dest", by.y = "faa") %>% 
  select(delay_arrive,name)
dest_name

# show the chart for the data 
ggplot(dest_name,aes(x= reorder(name, delay_arrive, decresing=F), y= delay_arrive))+
  geom_col()+
  theme_classic()+
  theme(axis.text.x = element_text(angle =60, vjust=0.5,hjust=0.5))+
  labs(x="Avreae delay ", y="Destination")

# Task-4: show The most popular airlines name from JFK

most_popular <-
  flights %>% 
  filter(origin=="JFK") %>% 
  group_by(carrier) %>% 
  summarise(amount_flights = n()) %>% 
  arrange(-amount_flights) %>% 
  head(10)

most_popular

most_popular_airlines <-
  merge(x=most_popular, y=airlines, by.x = "carrier", by.y = "carrier")
 

most_popular_airlines

ggplot(most_popular_airlines,aes(x = reorder(name, amount_flights, decrasing =F), y = amount_flights))+ 
#ggplot(most_popular_airlines,aes(y = name))+ 
  geom_col( color="blue", fill="black")+
  theme_bw()+
  coord_flip()
  
# --------------------------------------------------------
# --------------------------------------------------------

# Task-4: Use the first 1000 rows of flights datasets

df <- flights %>% 
  head(1000)

chart_1 <- df %>% 
  select(arr_delay, distance, carrier )

ggplot(chart_1, aes(x = distance, y =arr_delay, color=carrier))+ 
  geom_point()+
  theme_bw()+
  labs(x = "Distance", Y= "Arrival Delay" , title= "Arraive delay and distance by carrier" )


# --------------------------------------------------------
# how to label numbers in the chart  !!
chart_2 <-df %>% 
  select(arr_delay, distance, air_time )

ggplot(chart_2, aes(distance, arr_delay, size = air_time))+
  geom_point()+
  theme_classic()+
  labs(x = "Distance", Y= "Arrival Delay" , title= "Arraive delay and distance by air_time" )
  
# --------------------------------------------------------
  
chart_3 <- df %>% 
  select(arr_delay, distance, carrier )

ggplot(chart_3, aes(x = distance, y =arr_delay, shape=carrier))+ 
  geom_point()+
  theme_dark()+
  labs(x = "Distance", y= "Arrival Delay" , title= "Arraive delay and distance by carrier" )


# --------------------------------------------------------

chart_4 <- df %>% 
  select(arr_delay, distance, carrier )

ggplot(chart_4, aes(x = distance, y =arr_delay))+ 
  geom_point()+
  theme_linedraw()+
  facet_wrap(~carrier, nrow = 4)
  labs(x = "Distance", y= "Arrival Delay" , title= "Arraive delay and distance by carrier" )

  # --------------------------------------------------------
  
  chart_4 <- df %>% 
    select(arr_delay, distance )
  
  ggplot(chart_4, aes(x = distance, y =arr_delay))+ 
    geom_point()+
    geom_smooth()+
    theme_minimal()+
  labs(x = "Distance", y= "Arrival Delay" , title= "Arraive delay and distance by carrier" )
  
  # --------------------------------------------------------
  
  chart_5 <- df %>% 
    select(arr_delay, distance )
  
  ggplot(chart_5, aes(x = distance, y =arr_delay))+ 
    geom_violin()+
    theme_void()+
    labs(x = "Distance", y= "Arrival Delay" , title= "Arraive delay and distance by carrier" )
