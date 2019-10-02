library(readxl)
library(ggplot2)
library(ggrepel)
library(data.table)
library(dplyr)
library(magrittr)

file <- read_excel("Table B.3_nurshome.xlsx")

B <- file[which.max(file$resident),]
S <- file[which.min(file$resident),]





png(file="C2_18 Number of nursing house resident.png", width = 900, height = 500)
boxplot(file$resident, 
        main = "Number of nursing house resident",
        xlab = "Number (per 1000)",
        ylab = "resident",
        col = "powderblue",
        border = "blue",
        horizontal = TRUE,
        notch = TRUE
)
dev.off()

p <- ggplot(file, aes(resident, fill = cut(resident, 100)))+
  geom_histogram(show.legend = FALSE)+
  theme(plot.title = element_text(hjust = 0.5))+
  ggtitle("Number of nursing house resident(hist)")

png(file="C2_18 Number of nursing house resident(hist).png", width = 700, height = 500)
p
dev.off()