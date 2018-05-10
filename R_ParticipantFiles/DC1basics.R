# Data Carpentry Script 1:
# Intro: DC1basics 


#### Install the Tidyverse ####

install.packages("tidyverse") # Copy on the Console command line and hit Return or Enter

#### Basics ####

2 + 2 # Adds the two numbers

4 - 2

5 * 4

100 / 5

101 /5

101 %/% 5 # Just gives the number of complete times 5 goes into 100.


101 %% 5 # Modulo just gives the remainder.

#### Assigning Result Values to an Object

a <- 2 + 2 # Assigns the result to the object 'a'
b = 3 + 3 # The equals sign also works for assignment, but I will always use " <- " to assign something to an object.
c <- a + b
c # Returns the value of c


#### Basic Data Classes ####

vec_a <- 1:20

vec_b <- c(1, 4, 8, 9, 3, 2) # We use c() to concatenate values

vec_c <- rep(c(vec_b), each = 3) # instead of 'each =' we could also use 'times =' or 'length.out ='

vec_d <- c(1.1, 3.3)


# Some simple character vectors:
	
peopleNames <- c("Hadley", "Jenny", "Hilary", "Yihui")

vec_f <- c("1", "2", "3", "4", "5")


# A logical vector

logical_a <- c(TRUE, FALSE, FALSE, TRUE, FALSE)



str(vec_b)


str(vec_f)


#### Coercion ####

#### Coercion

vec_g <- c(1, "one", TRUE)
str(vec_g)

vec_h <- c(1, TRUE, 0, FALSE)
str(vec_h)

#### Factors ####

fac_a <- factor(c("red", "blue", "green"))
str(fac_a)

fac_b <- factor(c("Good", "Better", "Good", "Best", "Better"), levels = c("Good", "Better", "Best"),  ordered = TRUE)
str(fac_b)

vec_i <- c(fac_b, TRUE)
str(vec_i)

vec_j <- c(fac_b, "Bad")
str(vec_j)

#### Basic Object Types ####

mat_a <- matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
mat_a

# Changing the `byrow =` option:
	
mat_b <- matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = FALSE)
mat_b

# A numeric matrix:
	
mat_c <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
mat_c

# Multiplying by matrices:
	
mat_d <- matrix(1:6, nrow = 2, ncol = 3, byrow = FALSE)
mat_c * mat_d

dim(iris)

head(iris)

str(iris)

# Dataframes

vec_a <- 1:12 # This deletes our old vec_a permanently and without warning.
vec_b <- sample(1:100, size = 12, replace = TRUE) # Randomly sampling 12 numbers between 1 and 100 with replacement (meaning you could get the number 88 twice). You will get different numbers every time you run this.
fac_a <- rep(fac_a, times = 4) # fac_a had a length() of 3 but now it is length 12
peopleNames <- rep(peopleNames, each = 3) # What happens if you run this line and the one above it multiple times (DON'T TRY IT.)

df_a <- data.frame(vec_a, vec_b, fac_a, peopleNames)
head(df_a)

# A List

list_a <- list(mtcars, iris, "a", 1, c(TRUE, FALSE, FALSE), "the kitchen sink")

#### Working Directory and Creating an R Project ####

# When working with R it is important to know your working directory. You can find out your working directory by running:

getwd()

# You can set your working directory by inserting a pathname into `setwd()`, or by doing this in RStudio by clicking on the Session dropdown menu.

setwd("/Users/brian/Dropbox/db_documents/HomeRwork/DataCarpentry")
