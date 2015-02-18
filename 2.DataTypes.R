x <- 10:1
y <- -4:5
q <- c("Hockey","Football","Baseball","Curling",'Lacrose',
       'Tennis','Cricket','Soccer',"dfj","dfkljs")
theDF <- data.frame(x,y,q)


theDF <- data.frame(First = x , Second = y, Sport = q)
theDF
beer <-c("Ale", "cider", "Lager", "Lager", "Lager","Lambic","Ale", "Ginger", "Ale", NA, NA)
beer <- as.factor(beer)
beer
as.numeric(beer)

#DataFrame memory gets Factor
theDF$Sport
class(q)
class(theDF$Sport)


##For keeping datatypes intact while creating dataframe
theDF <- data.frame(First = x, Second = y, Sports = q, stringsAsFactors =  FALSE)
theDF


## Exploring dataframes
nrow(theDF)
ncol(theDF)
dim(theDF)
ncol
names(theDF)

# Summary of dataFrames
head(theDF)
head(theDF,4)
tail(theDF,3)

theDF[3,2]
## Row, Col
theDF[c(3,5),2]

## Each dataframe is list of vectors

theDF[3,]
theDF[c(3,5),]
theDF[,2:3]
theDF[c(3,5),2:3]

theDF[,2]

# Two get drop down to vectors.
theDF[,2,drop = FALSE]

theDF[,c("First",'Sports')]


## Ways to grab single column as vector or 
theDF[, 'Sports']
theDF$Sports

theDF['Sports']
theDF["Sports"]


# list
list(c(1,2,3))
list(1,2,3)

list2 <- list(c(1,2,3),3:7)
list2
list4 <- list(theDF, 1:10)
list4

class(list4)

list5 <- list(theDF, 1:10, list4)
list5
list5[1]

# [[]] For subsetting the list of values
list5[[1]]
list5[[2]]
list5[[3]]
list5[[3]][[1]][2]

names(list5) <- c("DataFrame", "Vector","List")
list5

list5[["Vector"]]
list5$Vector

## Metrices mutlidimentinal vector.

A <- matrix(1:10,nrow = 5)
A
B <- matrix(21:30, nrow  = 5)
B
C <- matrix(1:20, nrow = 2)
C
dim(A)
nrow(A)
ncol(A)
colnames(A)
rownames(A)


# Matrix operations..
A + B
sqrt(A)
sum(A)

#Element-by-element comparision
A == 5
A == B
t(A)
A == 5

t(theDF)

A
C
# Dot products in matrix
A %*% C
crossprod(A,B)





