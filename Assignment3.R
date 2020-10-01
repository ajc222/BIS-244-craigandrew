#Andrew Craig
#BIS 244

library(tidyverse)

us_counties <- read_csv("covid-19-data/us-counties.csv")
view(us_counties)

paData <- us_counties %>% filter(state=="Pennsylvania")
myData <- paData %>% filter(county=="Lehigh")
view(myData)
plot(x=myData$date, y=myData$cases, type="o", main="Cases and Deaths of COVID-19", xlab="Date", ylab="Infections")
points(x=myData$date, y=myData$deaths, col="red", pch="*")
lines(x=myData$date, y=myData$deaths, col="red",lty=2)
legend("topleft", legend = c("Cases (BLACK)", "Deaths (RED)"))
