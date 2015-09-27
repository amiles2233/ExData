# Plot 2

# Change Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/ExData/Project 2"
setwd(wkdir)

# Load Data
nei <- readRDS("summarySCC_PM25.rds")

# Subset Data
balt <- filter(nei, fips==24510)

# Summarize Data
plot2 <- balt %>%
    group_by(year) %>%
    summarize(Emissions=sum(Emissions))

# Create and Save Plot 2
png(filename = "plot2.png")

barplot(height=plot2$Emissions, names.arg = c("1999", "2002", "2005", "2008"),
                   ylab="PM2.5 Emissions (Tons)", xlab="Year",
                   main="Emissions by Year, Baltimore City",
                   ylim=c(0,3500))

dev.off()