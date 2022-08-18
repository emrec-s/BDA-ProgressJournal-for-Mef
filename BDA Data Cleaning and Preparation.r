library(readr)
library (dplyr)
library(lubridate)

earthquakes <- read_csv("/Users/emrecansigirci/Downloads/archive (3) 2/consolidated_data/consolidated_data.csv")

earthqfilter %>% distinct(type)

#earthqfilter <- filter(earthquakes,
#                       grepl("earthquake", type))

earthqfilter<- 
  earthquakes %>% filter(between(latitude,30,45))
                  
earthqfilter<-
  earthqfilter %>% filter(between(longitude,20,48))

earthqfilter$year<-year(earthqfilter$time)

earthqfilter<- filter(earthqfilter, mag!=0)

earthqfilter<- filter(earthqfilter, year>1975)

earthqfilter<- filter(earthqfilter, year<2009)

earthqfilter %>% distinct(type)

earthqfilter$horizontalError<-NULL
earthqfilter$nst <-NULL
earthqfilter$gap<-NULL
earthqfilter$dmin<-NULL
earthqfilter$depthError<-NULL

earthqfilter$magNst<-NULL

earthqfilter$magError<-NULL

write.csv(earthqfilter,"/Users/emrecansigirci/Documents/Attachments/earthquake.csv", row.names = TRUE)



ggplot(earthqfilter$mag, earthqfilter$time )
p <- ggplot(earthqfilter, aes(x=time, y=mag)) +
  geom_line()
           p       

 library(ggplot2)
 library(dplyr)
 library(plotly)
 library(hrbrthemes)
       earthqfilter %>% 
         ggplot( aes(x=time, y=mag)) +
         geom_line(color="#69b3a2") +
         ylim(0,10) +
         geom_hline(yintercept=5, color="orange", size=.5) +
         theme_ipsum()
           
