say.hello <- function()
{
  print("Hello world!")
}

timesTwo <- function(x)
{
  return(x * 2)
}

timesTwo(17)

timesTwo2 <- function(x)
{
  x * 2
}

timesTwo2(23)

timesN <- function(x, n){
  x * n
}

timesN(44,4)

timesN <- function(x, n=2)
{
  x * n
}

## Writing parametrised function with the default values.
hello.person <- function(first,last='desale')
{
    sprintf("Hello %s %s",first,last)
}
## do.call trick will allows us to specify the name of a function either
## as a character or as an object, and provide arguments as a list.

do.call('hello.person', args = list('devendra','desale'))

##  This is useful when building the function that allows user to specify an action.
run.this <- function(x, func = mean){
  do.call(func, args = list(x))
}
run.this(1:10)
run.this(1:10,sum)
