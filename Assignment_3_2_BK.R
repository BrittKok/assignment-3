## Assignment 3.2 Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 27-Jan-23       Britt Kok                  Original code

install.packages("devtools")
library(devtools)

#Q3.2R.1
remind_me <- function(){
  print("Friday 27th: submit R assignment")
  print("Friday 27th: submit happenings file at work")
  print("Monday 30th: prepare work meeting presentation")
}

rm(remind_me)
install_github("BrittKokBrittKok/assignment-3.git/remind_me")

cheat <- function(exercise){
  if (exercise == 1){
    print("grades <- rnorm(60, 7, 1)")
    print("hist(grades")
  } else if (exercise == 12){
    print("install.packages('quantmod')")
    print("library(quantmod)")
    print(paste("getSymbols(", "FSLR", ", from = ", "2022-01-01", ", to = ", "2022-12-31", ")", sep = ""))
    print(chart_Series(FSLR))
  } else if (exercise == 16){
    print("(matrix(1:9, nrow = 3, byrow = TRUE)) * c(1, 2, 3)")
  } else 
    print("This function only answer questions 1, 12 and 16")
}

#Q3.2R.2
library(dplyr)
make_art <- function(seed, n, palette) {
  set.seed(seed)
  dat <- tibble( 
    x0 = runif(n),
    y0 = runif(n), 
    x1 = x0 + runif(n, min = -2, max = 2),
    y1 = y0 + runif(n, min = -4, max = 4),
    shade = runif(n), 
    linewidth = runif(n)
  )
  
  # plot segments in various colors, using 
  # polar coordinates and a gradient palette
  dat |> 
    ggplot(aes(
      x = x0,
      y = y0,
      xend = x1,
      yend = y1,
      colour = shade,
      linewidth = linewidth
    )) +
    geom_segment(show.legend = FALSE) +
    coord_polar() +
    scale_colour_gradientn(colours = palette) +
    scale_size(range = c(0, 10)) + 
    theme_void()
}

make_art(seed = 1, n = 500, palette = c("antiquewhite", "orange", "bisque"))
