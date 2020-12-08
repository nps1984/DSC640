library(tidyverse)
library(treemap)
library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)
library(maps)
library(mapproj)

options(scipen = 999)

bball <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_9-10/ex5-2/ppg2008.csv")
bball2 <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_9-10/ex5-2/ppg2008.csv")
costco <- read_csv("C:/cygwin64/home/salis/git/repos/DSC640/DSC640_NSalisbury_Week_9-10/ex5-2/costcos-geocoded.csv")

# View 
bball

# change order
bball <- bball[order(bball$PTS, decreasing = FALSE),]

# add rownames
#row.names(bball) <- bball$Name
bball <- column_to_rownames(bball, var = "Name")

# convert to matrix
bball_matrix <- data.matrix(bball)

bball_matrix
bball_heatmap <- heatmap(bball_matrix, Rowv=NA, Colv=NA, col = cm.colors(256), scale="column", margins=(c(5,1)))

# Contour plot
ggplot(data=bball, aes(x=FTA, y=PTS)) +
  geom_density2d(color = 'black') +
  ggtitle('Contour Plot') +
  labs(x = "FTA", y = 'PTS')


map(database="state")
symbols(costco$Longitude, costco$Latitude, bg="#e2373f", fg="#ffffff",
        lwd=0.5, circles=rep(1,length(costco$Longitude)),
        inches=0.05, add=TRUE)