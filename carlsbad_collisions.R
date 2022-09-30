library(tidyverse)
library(lubridate)

collisions <- read.csv("~/documents/carlsbad_accidents/collision_data.csv")

collisions$new_dates <- as.Date(collisions$date, "%m/%d/%Y")

collisions %>%
  view()

collisions$month <- month(collisions$new_dates)
collisions$year <- year(collisions$new_dates)


aggregate(collisions$new_month, by=list(new_month=collisions$new_month), FUN=sum)

collisions$new_month <- as.character(collisions$month)

table(collisions$month)

ggplot(collisions, aes(date)) +
  geom_density()

month_n_year <- data.frame(collisions$month,collisions$year)

table(month_n_year)

ggplot(Animals, aes(factor(Reason), Species, fill = Category)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1")