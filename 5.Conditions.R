k <- 1

if(k == 1){
  print("Hello")
}
k <- 0

if(k == 1){
  print("Hello")
}
k <- 3

if(k == 1){
  print("Hello")
} else if(k==0){
  print("bye")
}else
  print("then what")

ifelse(1==1, 'Yes','NO')

# Interesting looping structures with ifelse
toTest <- c(1,0,0,1,1)
ifelse(toTest == 1, 'Yes','No')


## The double form (&& or ||) is best used in if and the single form (& or |) 
## is necessary for ifelse. The double form compares only one element from each side,
## while the single form compares each element of each side.”

a <- c(1,1,0,1)
b <- c(2,1,0,1)

ifelse(a ==1 & b == 1, 'yes','no')

ifelse(a ==1 && b ==1, 'yes','no')




