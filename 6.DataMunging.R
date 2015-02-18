theMat <- matrix(1:9, nrow = 3)
theMat
apply(theMat, 1, sum)
apply(theMat, 2, sum)

rowSums(theMat)
df2 <- as.data.frame(theMat)
rowSums(df2)

theList <- list(A = matrix(1:9,3), B=1:5, C = matrix(1:4,2), D=2)
theList

lapply(theList, sum)

sapply(theList, sum)

?sapply

library(ggplot2)
data(diamonds)
head(diamonds)


?aggregate
aggregate(price ~ cut, diamonds,mean)



library(plyr)
# summarize meant to be called from other function
summarize(diamonds, AvgPrice = mean(price))
mean(diamonds$price)

# ddply take DF and retrun dataframe
# dlply take DF and return list

ddply(diamonds, "cut", nrow)

## Break in multiple datasets and pass summarize then provide additional  arg 
ddply(diamonds, "cut", summarise, AvgPrice = mean(price))

find average of caret in diamond

ddply(diamonds, c('cut','color'), summarise, AvgPrice = mean(price), AvgCarat = mean(carat))

#white  format -> long cast format 
library(reshape2)
head(airquality)
airMelt <- melt(airquality, id = c("Month","Day"))
airMelt


airMelt2 <- melt(airquality, c(1,3,5,6), id = c("Month", "Day"))

#Getting your data back
airCast <- dcast(airMelt, Month + Day ~ variable, value.var = "value")
head(airCast)


codes <- read.table("http://www.jaredlander.com/data/countryCodes.csv", header = TRUE, sep = ",")
countries <- read.table("http://www.jaredlander.com/data/GovType.csv", header = TRUE, sep = ',')
head(countries)
head(codes )
names(countries)
names(codes)
codes <- rename(codes, c(Country.name = "Country"))
names(codes)

countryJoined <- join(x = codes, y = countries, by = "Country")
head(countryJoined)
