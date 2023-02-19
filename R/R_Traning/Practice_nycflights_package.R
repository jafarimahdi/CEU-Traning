# install.packages('nycflights13')
library(ggplot2)
library(nycflights13)
library( tidyverse )


# getwd(). : check your local work directory 
# -------- read the local data-set file as .txt or .csv

# -if you have file in the same path and faced error to find, just switch the work directory
   # in R-studio :a)-go to session b)-Set working directory c)-chose directory d)- select the path

# task-1: Read the 3 diamonds data sets and show the head of that.

#  read.delim() for the .txt file
diamonds_txt <- read.delim("diamonds.txt", header = TRUE, sep = "#")
head(diamonds_txt)

# read.csv() for the .csv file
diamonds_csv <- read.csv("diamonds.csv",header = TRUE, sep = ";")
head(diamonds_csv)

diamonds_with_extra_lines <- read.delim("diamonds_with_extra_lines.txt",header = TRUE, sep = "\t")
head(diamonds_with_extra_lines)




