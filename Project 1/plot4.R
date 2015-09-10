# Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/Project 1"
setwd(wkdir)

# Read in Data
source(read_data.R)

# Plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

par(mfrow=c(2,2))


# --Part 1
plot(x=dat$DateTime, y=dat$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

# --Part 2
plot(x=dat$DateTime, y=dat$Voltage, type="l",
     ylab="Voltage", xlab="")

# --Part 3
plot(x=dat$DateTime, y=dat$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(x=dat$DateTime, y=dat$Sub_metering_2, col="red", type="l")
lines(x=dat$DateTime, y=dat$Sub_metering_3, col="blue", type="l")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
# --Part 4
plot(x=dat$DateTime, y=dat$Global_reactive_power, type="l",
     ylab="Global Reactive Power", xlab="")

dev.off()
