# Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/Project 1"
setwd(wkdir)

# Read in Data
source(read_data.R)

# Plot 2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(x=dat$DateTime, y=dat$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()