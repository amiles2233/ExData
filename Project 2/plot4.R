# Plot 4

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
scc <- readRDS("Source_Classification_Code.rds")

# ID Coal Cases
coal.boo <- grepl("Coal", scc$EI.Sector)
coal.cases <- filter(scc, coal.boo==T) 

# Subset and Summarize Data
coal.emis <- filter(nei, SCC %in% coal.cases$SCC) %>%
    group_by(year) %>%
    summarize(Emissions=sum(Emissions))

# Factor Year (Easier Plotting)
coal.emis$year <- factor(coal.emis$year)


# Create and Save Plot
png(filename = "plot4.png",
    width = 600, height=461)

ggplot(coal.emis, aes(x=year, y=Emissions)) +
    geom_bar(stat="identity") +
    scale_y_continuous(labels=comma) +
    ggtitle("Coal Emissions by Year") +
    xlab("Year") +
    ylab("Coal Emissions (Tons)")

dev.off()


