library(tidyverse)

cel <- read.csv("coursera.csv")

cel %>% 
  filter(congress ==115) %>% 
  ggplot(aes(x=dem))+
  geom_bar()

# check in the terminal the plot by comapring with frequency tables
table(filter(cel,congress==115)$dem)


cel %>% filter(congress ==115) %>% ggplot(aes(x=st_name))+geom_bar()

# flip the figure by setting y aesthetic rather than the x
cel %>% filter(congress ==115) %>% ggplot(aes(x=st_name))+geom_bar()

# recode the dm variable and categorical variable 
party <- recode(cel$dem,"1" = "Democrate","0"="Republican")

cel <- add_column(cel, party)

cel <- filter(congress==115) %>% ggplot(aes(x=party))+
  geom_bar()