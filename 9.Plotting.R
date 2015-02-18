
require(ggplot2)
data(diamonds)
head(diamonds)
hist(diamonds$carat,main = 'Carat hist', xlab = 'Carat')

#Scatterploat
plot(price ~ carat, data = diamonds)
#Box plots
boxplot(diamonds$price)
boxplot(price ~ cut, data = diamonds)

#Histograms
hist(diamonds$price)

library(ggplot2)

# mapping the variable using aes function and then add geom layers to specify plots
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
ggplot(diamonds, aes(x = price )) + geom_histogram()
ggplot(diamonds, aes(x = price)) + geom_density()

ggplot(diamonds, aes(x = price)) + geom_density(fill = "grey50")
ggplot(diamonds, aes(x = price)) + geom_density(color = "blue")
ggplot(diamonds, aes(x = price)) + geom_density(fill = "grey50",color = "red")


#Store plot for using again and again
g <- ggplot(diamonds, aes(x=carat, y = price))
g + geom_point()
# add different colors for the classes
g + geom_point(aes(color=cut))
# change shape of points and change saturation for points
g + geom_point(aes(color = cut), shape = 1, alpha = 1/3)

#usign formula to braeak use ~

# making multiple graphs per color
g + geom_point(aes(color= color)) + facet_wrap(~color)

g + geom_point(aes(color= color)) + facet_wrap(clarity~color)
ggplot(diamonds, aes(x = price)) + geom_histogram() + facet_wrap(~cut)
ggplot(diamonds, aes(x = price, fill = cut, color = cut)) +
  geom_histogram(position = position_dodge())
ggplot(diamonds,aes(y=price, x =1)) + geom_boxplot()
ggplot(diamonds,aes(y=price, x =cut)) + geom_boxplot()


## Impressive box plot cousin.
ggplot(diamonds, aes(y=price, x = cut)) + geom_violin()

## OVerlaying the plots
ggplot(diamonds, aes(y=price, x = cut)) + geom_violin() + geom_point()
## Order of overlaying plots matter a lot.
ggplot(diamonds, aes(y=price, x = cut)) + geom_point() + geom_violin()

#For clearly viewing the points use jitter plots
ggplot(diamonds, aes(y=price, x = cut)) + geom_jitter() + geom_violin()

ggplot(diamonds, aes(y=price, x = cut)) + geom_jitter() + geom_violin(alpha = 1/3)

# Line Graphs
ggplot(economics, aes(x=date, y=pop)) + geom_line()

# A common task for line plots is displaying a metric over
# the course of a year for many years. 
# To prepare the economics data we will use Wickham’s lubridate package,
# which has convenient functions for manipulating dates”
require(lubridate)

# Extract year and month
economics$year <- year(economics$date)

#the argument to month will return the name of the month not number
economics$month <- month(economics$date, label= TRUE)

# subset the data
# the which function returns the indices of observations where the
# tested condition was TRUE”
econ2000 <- economics[which(economics$year >= 2000), ]
                       
# load the scales package for better axis formatting
require(scales)
# build the foundation of the plot
g <- ggplot(econ2000, aes(x=month, y=pop))
# add lines color coded and grouped by year
# the group aesthetic breaks the data into separate groups
g <- g + geom_line(aes(color=factor(year), group=year))
# name the legend "Year"
g <- g + scale_color_discrete(name="Year")
# format the y axis
g <- g + scale_y_continuous(labels=comma)
# add a title and axis labels
g <- g + labs(title="Population Growth", x="Month", y="Population")
# plot the graph
g

require("ggthemes")
## save plot in variable.

g <- ggplot(diamonds,aes(x=carat, y= price, color = cut)) + geom_point()
g
g + theme_economist()
g + theme_economist() + scale_color_economist()
g + theme_tufte()
g + theme_few()
g + theme_wsj()
g + theme_wsj() + scale_color_wsj()

g + theme_excel()
g + theme_excel() + scale_color_excel()

# you can build a new theme in this package

ggplot(data.frame(x = rnorm(100)),aes (sample = x)) + stat_qq() + geom_abline()

head(tips)
# To see multiple visualization. use GGally
require(GGally)
GGally::ggpairs(tips)


