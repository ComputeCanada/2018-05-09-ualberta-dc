# Data Carpentry Script 2:
# Reading in Data and Cleaning
# DC2ReadClean

#### Flatfiles ####

# # Copy and paste (Block on the text then press 'CTRL + SHIFT + C' to uncomment. Then, copy and paste.)
# "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"
# "Mazda RX4", 21, 6, 160, 110, 3.9, 2.62, 16.46, 0, 1, 4, 4
# "Mazda RX4 Wag", 21, 6, 160, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4
# "Datsun 710", 22.8, 4, 108, 93, 3.85, 2.32, 18.61, 1, 1, 4, 1
# "Hornet 4 Drive", 21.4, 6, 258, 110, 3.08, 3.215, 19.44, 1, 0, 3, 1
# "Hornet Sportabout", 18.7, 8, 360, 175, 3.15, 3.44, 17.02, 0, 0, 3, 2
# "Valiant", 18.1, 6, 225, 105, 2.76, 3.46, 20.22, 1, 0, 3, 1
# "Duster 360", 14.3, 8, 360, 245, 3.21, 3.57, 15.84, 0, 0, 3, 4
# "Merc 240D", 24.4, 4, 146.7, 62, 3.69, 3.19, 20, 1, 0, 4, 2
# "Merc 230", 22.8, 4, 140.8, 95, 3.92, 3.15, 22.9, 1, 0, 4, 2
# "Merc 280", 19.2, 6, 167.6, 123, 3.92, 3.44, 18.3, 1, 0, 4, 4
# "Merc 280C", 17.8, 6, 167.6, 123, 3.92, 3.44, 18.9, 1, 0, 4, 4
# "Merc 450SE", 16.4, 8, 275.8, 180, 3.07, 4.07, 17.4, 0, 0, 3, 3
# "Merc 450SL", 17.3, 8, 275.8, 180, 3.07, 3.73, 17.6, 0, 0, 3, 3
# "Merc 450SLC", 15.2, 8, 275.8, 180, 3.07, 3.78, 18, 0, 0, 3, 3
# "Cadillac Fleetwood", 10.4, 8, 472, 205, 2.93, 5.25, 17.98, 0, 0, 3, 4
# "Lincoln Continental", 10.4, 8, 460, 215, 3, 5.424, 17.82, 0, 0, 3, 4
# "Chrysler Imperial", 14.7, 8, 440, 230, 3.23, 5.345, 17.42, 0, 0, 3, 4
# "Fiat 128", 32.4, 4, 78.7, 66, 4.08, 2.2, 19.47, 1, 1, 4, 1
# "Honda Civic", 30.4, 4, 75.7, 52, 4.93, 1.615, 18.52, 1, 1, 4, 2
# "Toyota Corolla", 33.9, 4, 71.1, 65, 4.22, 1.835, 19.9, 1, 1, 4, 1
# "Toyota Corona", 21.5, 4, 120.1, 97, 3.7, 2.465, 20.01, 1, 0, 3, 1
# "Dodge Challenger", 15.5, 8, 318, 150, 2.76, 3.52, 16.87, 0, 0, 3, 2
# "AMC Javelin", 15.2, 8, 304, 150, 3.15, 3.435, 17.3, 0, 0, 3, 2
# "Camaro Z28", 13.3, 8, 350, 245, 3.73, 3.84, 15.41, 0, 0, 3, 4
# "Pontiac Firebird", 19.2, 8, 400, 175, 3.08, 3.845, 17.05, 0, 0, 3, 2
# "Fiat X1-9", 27.3, 4, 79, 66, 4.08, 1.935, 18.9, 1, 1, 4, 1
# "Porsche 914-2", 26, 4, 120.3, 91, 4.43, 2.14, 16.7, 0, 1, 5, 2
# "Lotus Europa", 30.4, 4, 95.1, 113, 3.77, 1.513, 16.9, 1, 1, 5, 2
# "Ford Pantera L", 15.8, 8, 351, 264, 4.22, 3.17, 14.5, 0, 1, 5, 4
# "Ferrari Dino", 19.7, 6, 145, 175, 3.62, 2.77, 15.5, 0, 1, 5, 6
# "Maserati Bora", 15, 8, 301, 335, 3.54, 3.57, 14.6, 0, 1, 5, 8
# "Volvo 142E", 21.4, 4, 121, 109, 4.11, 2.78, 18.6, 1, 1, 4, 2

# Now run this code.

MT <- read.table("MTcars.txt", sep = ",", header = TRUE) # The 'sep =' could be anything, but whitespace (" "), semicolon, and Tab ("\t") are also common.
View(MT)

MT2 <- read.csv("MTcars.txt") # We could change the .txt to .csv, but it's unnecessary.
identical(MT, MT2)


# We can see that `read.csv()` is just a wrapper function for `read.table()` by entering `read.csv` (note the lack of parantheses).

read.csv

?read.table

# Using readr

library(readr)
MTcars <- read_csv("<filepath>/MTcars.txt")
View(MTcars)
str(MTcars)

MTcars <- read_csv("MTcars.txt", 
			 col_names = FALSE, skip = 1)
MTcarsNames <- as.character(read_csv("MTcars.txt", 
						 col_names = FALSE, n_max = 1))
MTcarsNames <- gsub(pattern = "\"", replacement = "", MTcarsNames) # Note the order of the arguments
MTcarsNames <- c("model", MTcarsNames)
names(MTcars) <- MTcarsNames



library(readr)
MTcars <- read_csv("MTcars.txt")
View(MTcars)
str(MTcars)


#### Selecting and Subsetting Data


MTcars[1,1] # This selects the first row and first column of MTcars
MTcars[3,1] # The third value from the first column.
MTcars[1:3,1] # The first three.
MTcars[c(3, 6, 10, 20:23, 28),1] # A specific selection
MTcars[seq(from = 1, to = nrow(MTcars), by = 2),1] # Can we tell what this did?


# We can do the same with columns.


MTcars[1,2] # The MPG value for the Mazda RX4

# Does this return a single value? What happens when we `str()` it. Hold this thought.

# We can get all the values in the `mpg` column just by leaving rows blank. (This works for rows as well, of course).

head(MTcars[,2])


# We have another way of selecting values, and this way will just return the value. We use the dollar sign `$` which we can think of as meaning 'select'.

head(MTcars$mpg)

# Notice the difference in the output. This is a vector of values, not a dataframe (or tibble).

MTcars$mpg[1] # This gives us the first value in the MPG column.
str(MTcars$mpg[1])

# With this knowledge we can get all sorts of info about our columns.

mean(MTcars$hp, na.rm = TRUE) # The extra argument here removes NAs from the data. We don't have any, but I want you to see it.
sd(MTcars$mpg) # Standard Deviation
min(MTcars$qsec) # Seconds for a quarter mile. The MT stands for 'Motor Trend' magazine, after all.
range(MTcars$qsec) 
plot(MTcars$hp, MTcars$qsec) # Yep, more horsepower correlates with faster times
# cor(MTcars$hp, MTcars$qsec) # Gives a negative correlation of -0.7082234


# Subset with a Logical Vector

MTcars_man1 <- MTcars[MTcars$am == 1, ] # Note that we use a double "="
head(MTcars_man1)

# Let's think about what this did. `MTcars$am == 1` creates a logical vector of `TRUE` and `FALSE`. For all of the `TRUE` values, a row is kept in the new dataframe.

# Subset with the Function `subset()`__

MTcars_man2 <- subset(MTcars, am == 1)
identical(MTcars_man1, MTcars_man2)

# Subset with `filter()`__
# A third method is to use the `dplr` package's `filter()`.

MTcars_man3 <- filter(MTcars, am == 1)
identical(MTcars_man1, MTcars_man3)

# Really?!

table(MTcars_man1 == MTcars_man3)

# Simple plot
plot(MTcars_man1$hp, MTcars_man1$qsec)
# cor(MTcars_man1$hp, MTcars_man1$qsec) # An even stronger correlation here: -0.8494566

mean(MTcars$hp[MTcars$am == 1], na.rm = T)
# mean(MTcars$hp[MTcars$am == 1], na.rm = T) == mean(MTcars_man1$hp, na.rm = T) # [1] TRUE

mean(MTcars$hp[MTcars$am == 1 & MTcars$cyl > 4], na.rm = T)
median(MTcars$hp[MTcars$am == 0 & MTcars$mpg <= 16], na.rm = T)
range(MTcars$hp[MTcars$disp >= median(MTcars$disp) | MTcars$cyl >= 8], na.rm = T) # I'm using two criteria to select my 'big' engine cars.

#### Exercise ####
# Uncomment the lines below and let's recreate this function call over multiple lines.
# range(MTcars$hp[MTcars$disp >= median(MTcars$disp) | MTcars$cyl >= 8], na.rm = T)

# aa <- median(MTcars$disp)
# bb <- 
# cc <- 
# dd <- 
# ee <- 
# range(ee, na.rm = T) # Needs to output: [1] 105 335

#### Tidy Data ####

LeisureAtt <- read.csv("LeisureAtt.csv") # Note we didn't use readr's read_csv()
View(LeisureAtt)

names(LeisureAtt) <- gsub("X", "", names(LeisureAtt)) # First let's get rid of that pesky "X"
library(tidyr) # A package with tidying functions like gather(), and its reverse, spread()
LeisureAtt <- gather(LeisureAtt, YEAR, ATTENDANCE, 2:7)
head(LeisureAtt, 3)

library(ggplot2) # function ggplot()
ggplot(LeisureAtt, aes(x = MONTH, y = ATTENDANCE)) + geom_bar(stat = "identity") + theme(axis.text.x  = element_text(angle=60, hjust = 1, vjust=1, size=8)) + facet_wrap(~ YEAR, ncol = 3) 

# Change the Month Factor
str(LeisureAtt$MONTH) # If we had used read_csv() this would be a character vector, but we wouldn't have had the "X" on the year names.
levels(LeisureAtt$MONTH)
LeisureAtt$MONTH <- factor(LeisureAtt$MONTH, levels = toupper(month.name)) # Note about the toupper(month.name)
levels(LeisureAtt$MONTH)

head(LeisureAtt)

ggplot(LeisureAtt, aes(x = MONTH, y = ATTENDANCE)) + geom_bar(stat = "identity") + theme(axis.text.x  = element_text(angle=60, hjust = 1, vjust=1, size=8)) + facet_wrap(~ YEAR, ncol = 3) 

#### Reading in Files from the Web

LeisureAttend <- read.csv(url("https://dashboard.edmonton.ca/api/views/iaa7-x8kk/rows.csv"))
head(LeisureAttend, 5)[,c(2:5,7)] # I'm omitting some columns for aesthetic reasons

str(LeisureAttend)
range(LeisureAttend$MONTHLY_ATTENDANCE)

LeisureAttend <- LeisureAttend %>% 
	filter(MONTHLY_ATTENDANCE != 0)

ggplot(LeisureAttend, aes(x = REPORT_PERIOD, y = MONTHLY_ATTENDANCE)) + geom_bar(stat = "identity") + theme(axis.text.x  = element_text(angle=60, hjust = 1, vjust=1, size=8))

#### Renaming Values and Dealing with Factors ####

xx <- MTcars$am
xx[xx == 0] <- "auto"
xx[MTcars$am == 1] <- "man" # This is a bit odd to do, but I did it to illustrate a point. Please ask, why?
MTcars$amChar <- xx # What did this do?
rm(xx)
identical((MTcars$am == 0), (MTcars$amChar == "auto"))
table((MTcars$am == 0) == (MTcars$amChar == "auto"))

# Creating MTcars$eng_size
xx <- character()
for (i in 1:nrow(MTcars)) {
	if (MTcars$disp[i] > (mean(MTcars$disp) + sd(MTcars$disp))) {
		xx[i] <- "big"
	} else if (MTcars$disp[i] < (mean(MTcars$disp) - sd(MTcars$disp))) {
		xx[i] <- "small"
	} else {
		xx[i] <- "avr"
	}
}
MTcars$eng_size <- factor(xx, levels = c("small", "avr", "big"), ordered = TRUE)
str(MTcars$eng_size)

# ifelse("Is this TRUE?", "Yes, so = ", "No, so = ")
xx <- ifelse(MTcars$disp > (mean(MTcars$disp) + sd(MTcars$disp)), "big", ifelse(MTcars$disp < (mean(MTcars$disp) - sd(MTcars$disp)), "small", "avr"))
xx <- factor(xx, levels = c("small", "avr", "big"), ordered = TRUE)
identical(xx, MTcars$eng_size)

# Change a factor level
xx <- MTcars$eng_size
xx[xx == "big"] <- "large" # Doesn't work

xx <- MTcars$eng_size
levels(xx)[levels(xx) == "big"] <- "large" # Works

# Getting rid of levels
LeisAttSummer <- filter(LeisureAttend, MONTH %in% c("JULY", "AUGUST", "SEPTEMBER"))
str(LeisAttSummer$MONTH)

LeisAttSummer <- droplevels(filter(LeisureAttend, MONTH %in% c("JULY", "AUGUST", "SEPTEMBER")))
str(LeisAttSummer$MONTH)

#### The Pipe: `%>%` ####

# Recreate:
# LeisAttSummer <- droplevels(filter(LeisureAttend, MONTH %in% c("JULY", "AUGUST", "SEPTEMBER")))
# LeisAttSummer <- LeisureAttend %>% 