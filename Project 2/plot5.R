# Plot 5


# Set Working Directory
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

# ID Vehicle Emissions Cases (could also use Type - ON-ROAD)
car.boo <- grepl("Vehicles", scc$EI.Sector)
car.cases <- filter(scc, car.boo==T)

# Subset and Summarize Data
car.emis <- filter(nei, SCC %in% car.cases$SCC, fips==24510) %>%
    group_by(year) %>%
    summarize(Emissions=sum(Emissions))

# Set year to be factor (helps with graphing)
car.emis$year <- factor(car.emis$year)

#Create Plot
png(filename = "plot5.png",
    width = 600, height=461)

ggplot(car.emis, aes(x=year, y=Emissions)) +
    geom_bar(stat="identity") +
    scale_y_continuous(labels=comma) +
    ggtitle("Vehicle Emissions - Baltimore") +
    xlab("Year") +
    ylab("Vehicle Emissions (Tons)")

dev.off()