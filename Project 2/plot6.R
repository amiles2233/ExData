# - Plot 6

# Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/ExData/Project 2"
setwd(wkdir)

# Load Dependencies
library(dplyr)
library(ggplot2)
library(scales)
library(labeling)
library(gridExtra)


# Load Data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# ID Vehicle Emissions Cases (could also use Type - ON-ROAD)
car.boo <- grepl("Vehicles", scc$EI.Sector)
car.cases <- filter(scc, car.boo==T)

# ID Counties
counties <- c("24510", "06037")

# Subset and Summarize Data
car.emis <- filter(nei,SCC %in% car.cases$SCC, fips %in% counties) %>%
    group_by(year, fips) %>%
    summarize(Emissions=sum(Emissions))

# Factorize Year
car.emis$year <- factor(car.emis$year)

# Create Baltimore Chart
balt.emis <- filter(car.emis, fips==24510)

balt <- ggplot(balt.emis, aes(x=year, y=Emissions)) +
            geom_bar(stat="identity", position="dodge") +
            scale_y_continuous(labels=comma) +
            ggtitle("Baltimore Vehicle Emissions") +
            xlab("Year") +
            ylab("Vehicle Emissions (Tons)")
    
# Create LA Chart
la.emis <- filter(car.emis, fips=="06037")

la <- ggplot(la.emis, aes(x=year, y=Emissions)) +
            geom_bar(stat="identity", position="dodge") +
            scale_y_continuous(labels=comma) +
            ggtitle("Los Angeles Vehicle Emissions") +
            xlab("Year") +
            ylab("Vehicle Emissions (Tons)")

# Save Both Plots
png(filename = "plot6.png",
    width = 778, height=461)

grid.arrange(balt, la, nrow=1)

dev.off()
