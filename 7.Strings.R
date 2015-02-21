library("stringr")
#Concates string 
paste("Hello", "Bob", "and other",sep= "/")
## paste is vectorised.
paste(c("Hello", "Bob", "and other"), c("charlie","Bob","David"))
paste("Hello", c("Bob","David","Charlie"))

#Collapse you can insert in between words
paste(c('hello','everyone','out there'), collapse = '+')

person <- "Jared"
partySize <- 15
waitTime <- 30
paste("Hello ", person, ", your party of", partySize, " Will be seated in ", 
      waitTime, " minutes", sep = "")

sprintf("Hello %s, your party of %s will be seated in %s minutes.", person, partySize, waitTime)

load(url("http://jaredlander.com/data/warTimes.rdata"))
head(warTimes)

library("stringr")
# while going through data split at ACAEA or - , and give me two pieces
theTimes <- str_split(warTimes, pattern = "(ACAEA)|-", n = 2)

head(theTimes)

theTimes <- str_split(string = warTimes,pattern = '(ACAEA|-)',n = 2)
which(str_detect(string = warTimes, pattern = '-'))

#Grab the first element only
theStart <- sapply(theTimes, function(x)x[1])
theStart
# Need to look more deeply 
theStart <- sapply(theTimes, '[',1)
'+'(1,3)

theStart
theStart <- str_trim (theStart)
theStart

str_sub(theStart, 1, 3)
str_sub(theStart, 5, 9)

str_detect(theStart, pattern ="January")
theStart[str_detect(theStart, pattern ="January")]

# Extract data
str_extract(theStart, pattern = "January")
#Pull out the first digit it could be found out
str_extract(theStart, pattern = "[0-9]")
str_extract(theStart, pattern = "[0-9][0-9][0-9][0-9]")
# use curly braces for the exact count
str_extract(theStart, pattern = "[0-9]{4}")

str_extract(theStart, pattern = "\\d{4}")
str_extract(theStart, "\\d{1,}")
# ^ means starting with & $ means ending with
str_extract(theStart, "^\\d{4}")
str_extract(theStart, "^\\d{4}$")

str_replace(theStart, pattern = "\\d", replacement = "x")

str_replace_all(theStart, pattern = "\\d", replacement = "x")

str_replace_all(theStart, pattern =  "\\d+", replacement = "x")

