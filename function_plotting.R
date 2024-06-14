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
  
## Adrian comments, 14. June 2024
## Everything works fine, very well done
## To consider:
## The data is now labelled which you can note, for example, when
## you simply call the dataframe there will be dbl+lbl
## in some cases, the labels can get frustrating to work with
## if that ever happens to you, consider first deleting the labels or 
## storing the labels in a separate data frame
## a package that can handle labels is sjlabelled::
  
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
