for(i in 1:10)
  print(i)

fruit <- c("Durian", "Dragon Fruit", "Star Fruit")

for (i in fruit)
  print (i)

x <- 1
while(x <= 5){
  print(x)
  x <- x + 1
}

for(i in 1:10){
  if(i == 3)
    next
  print(i)
}

for(i in 1:10 ){
  if(i==3)
    break
  print(i)
}

