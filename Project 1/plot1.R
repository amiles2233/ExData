# Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/Project 1"
setwd(wkdir)

# Read in Data
source(read_data.R)

# Plot 1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

hist(dat$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red")

dev.off()