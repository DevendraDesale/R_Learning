1 + 1
1 + 2 + 3
3 * 7 * 5
4 / 2
# Division using r is routine one
4 / 3
4 * 6 + 5

#Assignments in r
#Arrow used with directions
x <- 2
a <- b <- 7
q <- 5 -> r

# For meta-programming
assign('j', 4)


x <- 4

# Deleting variable From R
rm(j)


thevar <- 17

# Case sensitive langauge
##theVAR

x <- 2

#To know type of variable.
class(x)

#  . is just like _
is.numeric(x)

# making integer in R
i <- 5L
class(i)
is.integer(i)
is.numeric(i)

# R handles memory management
2 ^ 66
2 ^ 100

x <- "data"
# How many chars in x
nchar(x)

### ctrl + sht + c For multiline comments.

# Dates in R
date1 <- as.Date("2015-02-01")
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2015-02-01 09:11")
as.numeric(date2)
date2

# lubridate is easy package for dates

TRUE
FALSE
TRUE * 5
FALSE * 5

## Don't sharthand TRUE and FALSE
TRUE <- 3

2 == 3
2 != 3
2 <= 3
2 >=3
"data" =="stats"
"data" < "stats"

x <- c(1,2,3,4,5,6,7,8,9,10)
y <- c(1:10,14)
y
x * 3
x ** 2
sqrt(x)
10:1
-5:4
##Everything is vector in R
x + c(1,2)

x + c(1,2,3)

1:3 + 1:2 + 1:4

expand.grid(1:3,1:2,1:4)
## Concate 2 vectors
c(x,c(1,2))
?expand.grid
seq(1,10, by=2)

#Transforming vectors.
t(t(x))

x <= 5

sum(x<=5) >= 1

any(x<=5)
?any

all(x<=5)
x>y

q <- c("Hockey","Football","Baseball","Curling",'Lacrose',
       'Tennis','Cricket','Soccer')
## Inter-type upgardation happens For int to char
nchar(q)


#Retrieving from vectors.
x <- 10:1
x[1]
x[1:2]
x[-1]
x[c(1, 4)]

w <- c(One = 'a', Two = 'y', Lastl = 'r')
w
w["Two"]
w[c(1,3)]
w[c("One", "Last")]

names(w)
names(w)[2]
names(w)[2] <- "Second"
w


# Help in R
?mean
## Approximate name of variable.
apropos('mea')
z <- c(1,2,NA,3,8,NA)
is.na(z)
mean(x)
mean(z)
mean(z, na.rm=TRUE)

which(is.na(z))







