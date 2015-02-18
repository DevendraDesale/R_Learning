
# loading data from multiple files
tomato <-  read.table("http://www.jaredlander.com/data/Tomato%20First.csv", header = TRUE, sep = ",")


# read.csv don't use it unless u have illformed csv use "read.csv2"


#xml packages
# XLConnect
# xlsReadWrite
# RExcel

# Reading from databases
# RODBC
# RMySQL
# rhive
# rhdfs
# RPostgres
# RSQLite

theDF

## To put data online or around people and you can retrieve data back from running the generated code

dput(theDF)
structure(list(First = c(10L, 9L, 8L, 7L, 6L, 5L, 4L, 3L, 2L, 
                         1L), Second = -4:5, Sports = c("Hockey", "Football", "Baseball", 
                                                        "Curling", "Lacrose", "Tennis", "Cricket", "Soccer", "dfj", "dfkljs"
                         )), .Names = c("First", "Second", "Sports"), row.names = c(NA, 
                                                                                    -10L), class = "data.frame")


# Saving data to hardrive
save(tomato, file = "sauce.rdata")
dir()
rm(tomato)
tomato

# Saving the data files and send data around.
load("sauce.rdata")
tomato

n <- 20
r <- 1:10
w <- data.frame(n,r)
w
r
n
save(n,r,w, file = "multiple.rdata")
dir()
rm(n,r,w)
load("multiple.rdata")
n

# Reading from online data HTML table
library("XML")
bowlPool <- readHTMLTable("http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool",
                          header = FALSE, which = 1, stringAsFactors = FALSE)
bowlPool












