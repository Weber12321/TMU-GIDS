library(xlsx)
library(stringr)
library(dplyr)
library(tidyr)
library(magrittr)

setwd('C:/Users/Weber/Documents/GitHub/TMU-GIDS/world-happiness')

lf <- list.files(path = ".", pattern = "\\.csv")
fn <- gsub("\\.dat", "", lf)
for (i in seq_along(lf))
  assign(fn[i], read.csv(lf[i]))

head(`2015.csv`)
