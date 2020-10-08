#Andrew Craig 
#BIS 244

library(tidyverse)
library(scales)

twitch<-read.csv("Most Popular Twitch Streamers.csv")
twitch$Date <- as.Date(twitch$Date, "%m/%d/%Y")
str(twitch)

#view(twitch)

p <- ggplot(data= twitch, mapping = aes(x= Date, y= Viewers, color= Streamer))

p + geom_line(mapping = aes(group= Streamer))

p+geom_line()+ scale_y_continuous(breaks = c(0e+00, 1e+06, 2e+06, 3e+06), labels = c("0M", "1M", "2M", "3M"))+labs(title= "Most Popular Twitch Streamers")

p <- ggplot(data=twitch, mapping = aes(x= Date, y= Viewers, color= Streamer))

p+geom_line(mapping=aes(group= Streamer))+facet_wrap(~Streamer)
p+geom_line()+facet_wrap(~Streamer)+scale_y_continuous(breaks = c(0e+00, 1e+06, 2e+06, 3e+06), labels = c("0.0M", "1.0M", "2.0M", "3.0M"))+
  labs(title= "Most Popular Twitch Streamers")
