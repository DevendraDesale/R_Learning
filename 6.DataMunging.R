theMat <- matrix(1:9, nrow = 3)
theMat
apply(theMat, 1, sum)
apply(theMat, 2, sum)

# to deal with the NA use na.rm = TRUE argument.
rowSums(theMat)
df2 <- as.data.frame(theMat)
rowSums(df2)

theList <- list(A = matrix(1:9,3), B=1:5, C = matrix(1:4,2), D=2)
theList

lapply(theList, sum)

sapply(theList, sum)

?sapply

firstList <- list(A = matrix(1:16,4), B = matrix(1:16,2),C = 1:5)
secondList <- list(A = matrix(1:16,4), B = matrix(1:16,8),C = 15:1)

## Test element-by-element whether they are identical
mapply(identical,firstList,secondList)

## build a simple function that adds the number of rows (or length) of
## each corresponding element
simpleFunc <- function(x, y)
{
  NROW(x) + NROW(y)
}
# apply the function to the two lists
mapply(simpleFunc, firstList, secondList)


library(ggplot2)
data(diamonds)
head(diamonds)


?aggregate
aggregate(price ~ cut, diamonds,mean)

## To group the data by more than one variable, add the additional variable
## to the right side of the formula separating it with a plus sign (+).

aggregate(price ~ cut + color, diamonds, mean)
## To aggregate two variable use cbind on the left side of formula
aggregate(cbind(price,color)~cut,diamonds,mean)



library(plyr)
# summarize meant to be called from other function
summarize(diamonds, AvgPrice = mean(price))
mean(diamonds$price)

# ddply take DF and retrun dataframe
# dlply take DF and return list

ddply(diamonds, "cut", nrow)

## Break in multiple datasets and pass summarize then provide additional  arg 
ddply(diamonds, "cut", summarise, AvgPrice = mean(price))

# find average of caret in diamond

ddply(diamonds, c('cut','color'), summarise, AvgPrice = mean(price), AvgCarat = mean(carat))


## idata.frame is a good way to create ref to a data.frame, 
## so that subsetting is faster & memory efficient.
system.time(dlply(baseball,'id', nrow))
ibaseball <- idata.frame(baseball)
system.time(dlply(ibaseball,'id',nrow))

require(data.table)


theDF <- data.frame(A=1:10,
                    B = letters[11:20],
                    C = letters[11:20],
                    D = rep(c("one",'two','three'),length = 10))

theDT <- data.table(A=1:10,
                    B = letters[11:20],
                    C = letters[11:20],
                    D = rep(c("one",'two','three'),length = 10))
## The data.table creates index over every row like DB.
theDF

theDT

## The default data.frame returns character factors. But data.table doesn't
class(theDF$B)
class(theDT$B)
## Accessing the column data.
theDF[,c('A','C')]
## TO access columns we don't need character vectors.
theDT[,list(A,C)]

#Show Tables. shows all in-memory tables along with the size of each.
tables()
## We have to assign key to table explicitly for indexing.
## to accomlpish this use setkey function
setkey(theDT,D)
# see how all elements with same keys are sorted together.
theDT

## to get the key for perticular data.table
key(theDT)
## If we again checked for the tables() we will get key for the table this time.
tables()
## using this you can speed up searches.
theDT["one",]

## One can create keys using multiple columns
diamondsDT <- data.table(diamonds)
setkey(diamondsDT,cut,color)
## and use this for accessing the multiple columns

diamondsDT[J("Ideal","E"),]
## see we used J for joining the rows.
?J

## To get the aggregation of the data.
aggregate(price~cut, diamonds, mean)

## to do same with the data.table
diamondsDT[, mean(price),by = cut]
# To give name to the diamondDT result column
diamondsDT[, list(price=mean(price)),by = cut]
## one could include multiple column aggregations.
diamondsDT[, list(price=mean(price)),by = list(cut,color)]
diamondsDT[, list(price = mean(price), carat = mean(carat)),
            by = list(cut, color)]

## though one could easily use aggregate,**ply and other functions with data.table
## it is advisable not to do so.


## Downloading and unzipping a file using R
download.file(url="http://jaredlander.com/data/US_Foreign_Aid.zip",
               destfile="ForeignAid.zip")
unzip("ForeignAid.zip")
## load all data using for loop
require(stringr)
theDataFiles <- dir('data',pattern = '\\.csv')
for(file in theDataFiles)
{
  # give name to file 
  dataName <- str_sub(string = file, start = 12, end = 18)
  ## read the csv using read.table
  ## file.path is good way to specify a file name
  ## Also use stringsAsFactor to avoid factoring the string, import as characters.
  temp <-read.table(file= file.path("data",file),header=TRUE,sep = ',', 
                    stringsAsFactors = FALSE)
  assign(x= dataName, value=temp)
  
}

Aid_90s00s <- merge(x = Aid_90s, y = Aid_00s, by.x = c("Country.Name","Program.Name"),
                    by.y = c("Country.Name","Program.Name"))
## merge can be pretty slower than its other alternatives.

head(Aid_90s00s)

## alternatively plyr could be used with 'join' function, but it requires that the 
## column names should match for joining.

require(plyr)
Aid_90s00sPlr <- join(x = Aid_90s,y=Aid_00s,by = c('Country.Name','Program.Name'))
head(Aid_90s00sPlr)

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
