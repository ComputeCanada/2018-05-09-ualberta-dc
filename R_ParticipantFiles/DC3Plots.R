# Data Carpentry Script 3:
# Plotting Your Data
# DC3Plots

library(ggplot2)
library(dplyr)
library(ggthemes) # install.packages("ggthemes")
library(hflights) # install.packages("hflights")

#### Base Plots ####

hist(iris$Sepal.Length[iris$Species == "setosa"])

hist(iris$Sepal.Length[iris$Species == "setosa"], breaks = 10, col = "blue", xlab = "Sepal Length", 
     main = "Histogram for Setosa")

plot(density(iris$Petal.Length[iris$Species == "virginica"]))

plot(MTcars$disp, MTcars$hp)

pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,data=iris, main = "Simple Scatterplot Matrix")

plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, pch = 2)
legend(6.8, 4.4, unique(iris$Species), col = 1:length(iris$Species), pch = 2)


#### GGplot2 ####
# library(ggplot2)
aa <- ggplot(MTcars, aes(x = hp, y = qsec)) # The data we want to plot. "ggplot(MTcars, aes(hp, qsec))" would also work.


aa + geom_point()
bb <- aa + geom_point()

bb + geom_smooth()

ggplot(MTcars, aes(hp, qsec)) +
geom_point() +
geom_smooth()

ggplot(MTcars, aes(hp, qsec, colour = cyl)) +
	geom_point() +
	geom_smooth()

MTcars$cyl <- as.factor(MTcars$cyl)
ggplot(MTcars, aes(hp, qsec, colour = cyl)) +
	geom_point() +
	geom_smooth()

MTcars <- MTcars %>% # This uses the dplyr package
	mutate(hp2wt = hp/wt)


MTcars$hp2wtB <- MTcars$hp/MTcars$wt
identical(MTcars$hp2wt, MTcars$hp2wtB)

MTcars$hp2wtB <- NULL

Now we will use the new column `hp2wt` as the new `x` variable.

ggplot(MTcars, aes(hp2wt, qsec, colour = cyl)) +
geom_point() +
geom_smooth()

ggplot(MTcars, aes(hp2wt, qsec, colour = cyl)) +
	geom_point() +
	geom_smooth(aes(fill = cyl))

#### Bar Plots ####

head(hflights)
glimpse(hflights)
summary(hflights)

sort(table(hflights$Dest))

## Re-create a plot
# DALhfli <- hflights %>%
# 	...
# DALhfli <- within(DALhfli, UniqueCarrier <- factor(UniqueCarrier, levels = names(sort(table(UniqueCarrier), decreasing = TRUE)))) # Let's not worry about what this does at the moment.
# ggplot(DALhfli, ...

ggplot(LeisureAttend, aes(REPORT_PERIOD, MONTHLY_ATTENDANCE)) + geom_bar()

#### Setting Labels, etc. ####

aa <- ggplot(LeisureAttend, aes(REPORT_PERIOD, MONTHLY_ATTENDANCE)) + geom_bar(stat = "identity")
aa

aa <- ggplot(LeisureAttend, aes(x = MONTH, y = MONTHLY_ATTENDANCE, fill = as.factor(YEAR)))
aa + geom_bar(stat = "identity")

bb <- aa + geom_bar(stat = "identity", position = "dodge")
bb

LeisureAttend$MONTH <- factor(LeisureAttend$MONTH, levels = toupper(month.name))

cc <- bb + theme(axis.text.x  = element_text(angle = 60, hjust = 1, vjust = 1, size = 8))
cc

dd <- cc + scale_y_continuous("ATTENDANCE", labels = scales::comma)
dd

ee <- dd + guides(fill = guide_legend(title = "Year")) # There are at least five different ways to do this. This isn't my favourite.
ee

ff <- ee + scale_fill_brewer(palette = "YlGnBu")
ff

# The full plot
ggplot(LeisureAttend, aes(x = MONTH, y = MONTHLY_ATTENDANCE, fill = as.factor(YEAR))) + 
	geom_bar(stat = "identity", position = "dodge") + 
	theme(axis.text.x  = element_text(angle=60, hjust = 1, vjust=1, size=8)) + 
	scale_y_continuous("ATTENDANCE", labels = scales::comma) +
	guides(fill = guide_legend(title = "Year")) +
	scale_fill_brewer(palette="YlGnBu")

ff + theme_tufte()
ff + theme_fivethirtyeight()
ff + theme_classic() # * from ggplot2

theme_tufte

#### Exercise ####
# Try changing one aspect of the plot `ff` (this will be easier if you use the large code block above). Try doing a google search for adding a title, (add title ggplot2), changing the y-axis label (change y axis label ggplot2), or making the legen title bold... or whatever you want.


#### Bad Bar Plots ####

dat <- read_csv("dat.csv")
datSum <- dat %>%
	group_by(Key) %>% 
	summarise(mean = mean(Value), upper = mean(Value) - sd(Value), lower = mean(Value) + sd(Value))
datSum

ggplot(data = datSum, aes(x = Key, y = mean)) + geom_bar(stat = "identity") + geom_errorbar(data = datSum, aes(x = Key, ymin = upper, ymax = lower), width = 0.2, size = 1, color = "blue") 

ggplot(dat, aes(Value, fill = Key)) + geom_density(alpha = .5)

wilcox.test(dat$Value[dat$Key == "A"], dat$Value[dat$Key == "B"])
# t.test(dat$Value[dat$Key == "A"], dat$Value[dat$Key == "B"])

# If you are ever tempted to make a bar plot with error bars, use a boxplot instead.

ggplot(dat, aes(Key, Value)) + geom_boxplot()