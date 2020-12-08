library(tidyverse)
library(treemap)
library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)

expenditures <- read_tsv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_5-6/expenditures.txt")
unemployment <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_5-6/unemployement-rate-1948-2010.csv")


recent_exp <- subset(expenditures, year >=2005)

unemploy_agg <- unemployment %>%
  group_by(Year) %>%
  summarise(mean = mean(Value))


top10_exps_groups <- expenditures %>%
  group_by(category) %>%
  summarise(tot_exp = sum(expenditure)) %>%
  arrange(desc(tot_exp)) %>%
  slice(1:10)


top10 <- expenditures[is.element(expenditures$category, top10_exps_groups$category),]

expenditures_agg <- top10 %>%
  group_by(year, category) %>%
  summarise(n = sum(expenditure)) %>%
  mutate(percentage = n / sum(n))


treemap(recent_exp, index=c("year","category"), vSize="expenditure",
        type="index",
        fontsize.labels=c(15,12),                # size of labels. Give the size per level of aggregation: size for group, size for subgroup, sub-subgroups...
        fontcolor.labels=c("white","blue"),    # Color of labels
        fontface.labels=c(2,1),                  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
        bg.labels=c("transparent"),              # Background color of labels
        align.labels=list(
          c("left", "top"), 
          c("right", "bottom")
        )
)


ggplot(unemploy_agg, aes(x=Year, y=mean)) +
  #geom_area( fill="#69b3a2", alpha=0.4) +
  geom_area( fill="light blue", alpha=0.4) +
  geom_line(color="cornflowerblue", size=2) +
  ggtitle("Yearly Unemployment Rate") +
  xlab("Year") +
  scale_x_continuous(breaks = seq(1945, 2015, by = 5)) +
  ylab("Unemployment Rate")

ggplot(expenditures_agg, aes(x=year, y=percentage, fill=category)) + 
  geom_area(alpha=0.6 , size=.5, colour="white") +
  scale_fill_viridis(discrete = T) +
  ggtitle("Top 10 Expenditurs by Year") +
  xlab("Year") +
  scale_x_continuous(breaks = seq(1980, 2015, by = 5)) +
  ylab("Percentage of Expenditure")