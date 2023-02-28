library(ggplot2)
library(nycflights13)

flights <- (nycflights13::flights)

# Task-1: --------------------------------------
# create a bar chart, which show the top 10 destination in flight table 

top_dest<-
  flights %>% 
  group_by(dest) %>%                      
  summarise(number_of_fly = n()) %>% 
  arrange(-number_of_fly) %>% 
  head(10)

View(top_dest)

# ordering the columns by the value they have: reorder()
ggplot(top_dest, aes(x=reorder(dest, number_of_fly, decreasing=T),y = number_of_fly))+ 
  geom_col()+
  labs(x ="Number of fly", y = "Destanitaion", title = "Top 10 Destnation", subtitle ="data")+                 
  theme_linedraw() # change the theme to the new background 



# Task-2: -------------------------------------
  # find the best carrier base in arriving, 
 # on average the arr_delay is the least 
 # and change the chart colors to green 

best_arrive <-
  flights %>% 
  group_by(carrier) %>% 
  summarise(best_arrive =mean(arr_delay, na.rm = T)) %>% 
  arrange(best_arrive)

View(best_arrive)

ggplot(best_arrive,aes(x= reorder(carrier,best_arrive), y= best_arrive))+
  geom_col(fill='cyan4',color="limegreen")+
  labs(x ="Avrage on delay", y = "carirr",
       title = "Avrage delay")+                 
  theme_linedraw()




# Task-3: show the Average arrival delay by destinations "name" in August 
# and find the delay average by destination  -> 

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
View(dest_name)

# show the chart for the data 
ggplot(dest_name,aes(x= reorder(name, delay_arrive, decresing=F), y= delay_arrive))+
  geom_col()+
  theme_classic()+
  theme(axis.text.x = element_text(angle =60, vjust=0.5,hjust=0.5))+
  labs(x="Avreae delay ", y="Destination")
  
  




  