library(tidyverse)

cel <- read.csv("coursera.csv")
View(cel)


fig115 <- 
  filter(cel, congress == 115) %>% 
  select("seniority", "all_pass")

View(fig115)
head(fig115) # check the result 

# geom_point( )
ggplot(fig115, aes(x=seniority, y=all_pass))+
  geom_point()

# geom_jitter( )
ggplot(fig115, aes(x=seniority, y=all_pass))+
  geom_jitter()

# labs( )
ggplot(fig115, aes(x=seniority, y=all_pass))+
  geom_jitter()+
  labs(x='Seniority', y='bills passed', title="Seniority and Bills Passed in the 115th Congress")

# --------------------------
# step-2: modify filter and select to grab "dem"

fig115 <-
  cel %>% 
  filter(congress==115) %>% 
  select("seniority","all_pass","dem")

View(fig115$dem)

# show the data from new column to aes() as color 
ggplot(fig115,aes(x=seniority, y=all_pass, color=dem))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed", title = "Seniority and Bilss passed in the 115th Congres")

# make dem a categorical variable called "party"

party<-recode(fig115$dem, '1'="Democrat", '0'="Republican")

fig115 <- add_column(fig115, party)

View(fig115)

ggplot(fig115, aes(x=seniority, y=all_pass, color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed", title = "Seniority and Bills")

# give our performance color manually to the chart : scale_color_manual( )
ggplot(fig115, aes(x=seniority, y=all_pass, color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed", title = "Seniority and Bills")+
  scale_color_manual(values = c("blue","red"))

# change the general view of the cahrt: facet_wrap(~ )
ggplot(fig115, aes(x=seniority, y=all_pass, color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed", title = "Seniority and Bills")+
  scale_color_manual(values = c("blue","red"))+
  facet_wrap(~party)



