# R programming, Week_2, pollutantmean.R
# Author: X.Li 
# Time: 11/04/2017

#nums<- c(2, 6, 3, 2, 5, 6)
#dup <- numeric()

#numeric(0)
#for (num in nums){
#  dup <- c(dup,num)
#}

rm(list = ls())
setwd("/Users/xiuyuanli/Documents/Data Science/R_programing/")

pollutantmean <- function(directory, pollutant, id=1:332){
  
  means <-c()
  
  for (i in id) {
    path <- paste(getwd(),"/",directory,"/",sprintf("%03d", i), ".csv", sep = "")
    i_data <- read.csv(path)
    values <- i_data[pollutant]
    means <- c(means, values[!is.na(values)])
  }
  
  mean(means)
}

# First Question
#pollutantmean("specdata", "sulfate", 1:10)

# Second Question 
#pollutantmean("specdata", "nitrate", 70:72)

# 3. 
#pollutantmean("specdata", "sulfate", 34)

# 4. 
pollutantmean("specdata", "nitrate") # make sure assign the range " 1 to 332 " to "id"