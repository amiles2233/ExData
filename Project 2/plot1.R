#Plot 1

# Change Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/ExData/Project 2"
setwd(wkdir)

# Load Data
nei <- readRDS("summarySCC_PM25.rds")

# Make Divide Emissions by 1 million
nei$Emissions1 <- nei$Emissions/1000000

# Summarize Data
plot1 <- nei %>%
            group_by(year) %>%
            summarize(Emissions1=sum(Emissions1))

# Create and Save Plot 1
png(filename = "plot1.png")

barplot(height=plot1$Emissions1, names.arg = c("1999", "2002", "2005", "2008"),
                           ylab="PM2.5 Emissions (Million Tons)", xlab="Year",
                           main="Emissions by year, Whole Country")
dev.off()

