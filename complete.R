# R programming, Week_2, complete.R
# Author: X.Li 
# Time: 11/04/2017

rm(list = ls())
setwd("/Users/xiuyuanli/Documents/Data Science/R_programing/")

complete <- function(directory, id){  # 332 was added for the next setp "coor.R"
  results <- data.frame(id=numeric(0), nobs=numeric(0)) 
  
  for (i in id) {
    path <- paste(getwd(),"/",directory,"/",sprintf("%03d", i), ".csv", sep = "")
    i_data <- read.csv(path)

    i_data <- i_data[!is.na(i_data$sulfate),] # filter our those rows having NA of sulfate
    i_data <- i_data[!is.na(i_data$nitrate),] # filter our those rows having NA of nitrate
    
    nobs <- nrow(i_data)
    results <- rbind(results, data.frame(id=i, nobs=nobs))
  }
  results
  
}


# 5 
#cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))

# 6
# cc <- complete("specdata", 54)
# print(cc$nobs)

# 7 
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


