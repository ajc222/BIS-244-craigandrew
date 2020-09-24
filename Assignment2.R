#Assignment 2 
#BIS 244
#Andrew Craig
#install.packages("tidyverse")
library(tidyverse)

us_states <- read_csv("covid-19-data/us-states.csv")
view(us_states)
paData <- us_states %>% filter(state=="Pennsylvania")
view(paData)

## 4/21, 2020 deaths should go down by 282
## 4/22, they should go down by 297

paData <- mutate(paData, adj_deaths = deaths)
w <- length(paData$date)

for (i in 1:w) 
{
  if (as.character(paData$date[i])=="2020-04-21")
    {
      paData$adj_deaths[i] <- (paData$deaths[i] - 282)
    }
  else if (as.character(paData$date[i])=="2020-04-22")
    {
      paData$adj_deaths[i] <- (paData$deaths[i] - 282)
    }
}

sum(paData$adj_deaths)
