library(tidyverse)
library(treemap)
library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)
library(maps)
library(mapproj)
library(reshape2)
library(plotly)

options(scipen = 999)

edu <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_11-12/ex6-2/education.csv")

# View 
edu

# histogram
ggplot(edu, aes(x=writing)) +
  geom_histogram(binwidth=15, color="darkblue", fill="lightblue") +
  ggtitle('Histogram of Writing Scores') +
  labs(x = "Writing Score")

# melt and filter the scores
melted_edu <- melt(edu, id = "state")
melted_edu_filtered <- melted_edu %>% 
  filter(variable == "reading" | variable == "writing" | variable == "math")

ggplot(melted_edu_filtered, aes(x=variable, y=value)) +
  geom_boxplot(fill='#A4A4A4', color="black")+
  theme_classic() +
  ggtitle('Boxplot of Scores') +
  labs(x = "Subject", y = "Score")

oms = edu %>% filter(state == 'Ohio') %>% select(math)
ims = edu %>% filter(state == 'Indiana') %>% select(math)
mms = edu %>% filter(state == 'Michigan') %>% select(math)
mms

fig <- plot_ly() 

fig <- fig %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 546,
    #delta = list(reference = 200),
    domain = list(x = c(0.25, 1), y = c(0.08, 0.25)),
    title =list(text = "Ohio Math Score"),
    gauge = list(
      shape = "bullet",
      axis = list(range = c(NULL, 700)),
      threshold = list(
        line= list(color = "black", width = 2),
        thickness = 0.75,
        value = 170),
      steps = list(
        list(range = c(0, 571), color = "gray"),
        list(range = c(571, 715), color = "lightgray")),
      bar = list(color = "black"))) 
fig <- fig %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 507,
    #delta = list(reference = 200),
    domain = list(x = c(0.25, 1), y = c(0.4, 0.6)),
    title =list(text = "Indiana Math Score"),
    gauge = list(
      shape = "bullet",
      axis = list(range = c(NULL, 700)),
      threshold = list(
        line= list(color = "black", width = 2),
        thickness = 0.75,
        value = 170),
      steps = list(
        list(range = c(0, 571), color = "gray"),
        list(range = c(571, 715), color = "lightgray")),
      bar = list(color = "black"))) 
fig <- fig %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 603,
    #delta = list(reference = 700),
    domain = list(x = c(0.25, 1), y = c(0.7, 0.9)),
    title =list(text = "Michigan Math Score"),
    gauge = list(
      shape = "bullet",
      axis = list(range = c(NULL, 700)),
      threshold = list(
        line= list(color = "black", width = 2),
        thickness = 0.75,
        value = 170),
      steps = list(
        list(range = c(0, 571), color = "gray"),
        list(range = c(572, 715), color = "lightgray")),
      bar = list(color = "black"))) 

fig