# R programming, Week_2, coor.R
# Author: X.Li 
# Time: 11/04/2017

rm(list = ls())
setwd("/Users/xiuyuanli/Documents/Data Science/R_programing/")

# define complete again 
complete <- function(directory, id=1:332){  # 332 was added for the next setp "coor.R"
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
complete_rows <- complete("specdata",1:332) # get the results of complete rows

coor <- function(directory, thred){
  corr_results <- numeric(0)
  
  results <- data.frame(id=numeric(0), nobs=numeric(0)) 
  
  complete_rows <- complete_rows[complete_rows$nobs>=thred, ]
  
  for (i in complete_rows$id) {
    path <- paste(getwd(),"/",directory,"/",sprintf("%03d", i), ".csv", sep = "")
    i_data <- read.csv(path) # load data 
    
    i_data <- i_data[!is.na(i_data$sulfate),] # filter our those rows having NA of sulfate
    i_data <- i_data[!is.na(i_data$nitrate),] # filter our those rows having NA of nitrate
    sulfate <- i_data["sulfate"]
    nitrate <- i_data["nitrate"]
    
    corr_results <- c(corr_results, cor(sulfate,nitrate))
    
  }
  corr_results
}




# 8 
cr <- coor("specdata",0)                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

# 9 
cr <- coor("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

# 10 
cr <- coor("specdata", 2000)                
n <- length(cr)                
cr <- coor("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
