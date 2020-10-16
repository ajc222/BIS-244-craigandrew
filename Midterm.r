#Andrew Craig
#BIS-244 Midterm

library(tidyverse)

library(scales)
library(gapminder)
library(dplyr)

#Read in Covid data set
covidData <- read.csv("data.csv")

#Define our G7 countries
g7Countries <- c("Canada", "France", "United_Kingdom", "United_States_of_America", "Italy", "Germany", "Japan")
countries <- covidData[covidData$countriesAndTerritories %in% g7Countries]

#How many days have passed based on a specific month (the first zero adjusts for arrays starting at an idex of 0)
monthDays <- c(0, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335)

#Add accurate day of year column so we can accurately graph
countries <- mutate(countries, dayOfYear = (day + monthDays[month]))

#Plot graph
p <- ggplot(data = countries, mapping = aes(x = dayOfYear, y = cases, color = countriesAndTerritories))

#The breaks are based on calculated total days of year
p + geom_line() + scale_x_continuous(breaks=c(60, 152, 213, 305), labels = c("Feb", "May", "Jul", "Oct")) +
  labs(title = "G7 COVID-19 Case Counts", x = "", y = "New Cases per Day", subtitle = "By Andrew Craig as of 2020-10-16", caption = "Data: ECDC Times")


#dayOfYear<-function(d,m)
#{
# 
#}