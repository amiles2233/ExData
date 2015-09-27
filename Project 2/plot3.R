# Plot 3

# Change Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/ExData/Project 2"
setwd(wkdir)

# Load Dependencies
library(dplyr)
library(ggplot2)
library(scales)
library(labeling)

# Load Data
nei <- readRDS("summarySCC_PM25.rds")

# Subset and Summarize Data
plot3 <- nei %>%
    filter(fips==24510) %>%
    group_by(year, type) %>%
    summarize(Emissions=sum(Emissions))

# Create Plot
png(filename = "plot3.png",
    width = 778, height=461)

ggplot(plot3, aes(x=year, y=Emissions, color=type)) +
    geom_line() +
    scale_y_continuous(labels=comma) +
    ggtitle("Type of Emissions by Year, Baltimore City") +
    xlab("Year") +
    ylab("Emissions (Tons)")

dev.off()
# Save Plot
ggsave(filename="plot3.png")

