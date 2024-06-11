### Beyond R ####
# 11/6/2024

#packages
library(haven)
library(ggplot2)

#read in data 
df <- read_sav("data/sample.sav")
#View(df)


### function plot variable (with ggplot)

func_plot <- function(data, variable){
  #check variable in data frame
  if (!(variable %in% names(data))) {
    stop("Variable not found in data frame")
  }
  # check variable numeric  
  if(!is.numeric(data[[variable]])) {
    stop("Variable is not numeric")
  }
  
  
  #plotting 
  ggplot(data, aes_string(x = variable)) +
    geom_bar(fill = "skyblue", color = "black") +
    labs(title = paste("Histogram of", variable),
         x = variable,
         y = "Frequency") +
    theme_minimal()
  
}

func_plot(df, "gen")
func_plot(df, "age")
func_plot(df, "men_warm") 
