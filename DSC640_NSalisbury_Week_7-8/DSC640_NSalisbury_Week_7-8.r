library(tidyverse)
library(treemap)
library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)

options(scipen = 999)

tv_sizes <- read_tsv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_7-8/ex4-2/tv_sizes.txt")
crime_rates <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_7-8/ex4-2/crimerates-by-state-2005.csv")

crime_rates_filtered <- filter(crime_rates, state != "United States" & state != "District of Columbia")

ggplot(crime_rates_filtered, aes(x=murder, y=burglary )) + 
  geom_point(color="blue") +
  ggtitle("Murder Rate vs Burglary Rate") +
  xlab("Murder Rate") +
  ylab("Burglarly Rate")


ggplot(crime_rates_filtered, aes(x=murder, y=burglary )) + 
  geom_point(color="dark green", aes(size=population)) +
  ggtitle("Murder Rate vs Burglary Rate") +
  xlab("Murder Rate") +
  ylab("Burglarly Rate")

ggplot(tv_sizes, aes(size)) +
  geom_density() +
  xlim(0, 105)

