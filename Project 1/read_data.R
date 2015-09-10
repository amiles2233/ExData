

# Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Coursera Data Science/Exploratory Data Analysis/Project 1"
setwd(wkdir)


# Read Data
if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file <- unzip(temp)
    unlink(temp)
}
dat <- read.table(file, header=T, sep=";", stringsAsFactors = F)

# Format Date & Time
dat$DateTime <- as.POSIXct(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"))

# Restrict Dataset to the two specified days
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
dat <- dat[(dat$Date=="2007-02-01") | (dat$Date=="2007-02-02"),]

# Handle Missing Values
for (i in 3:8) {
    dat["?",i] <- NA
}

# Recode Output Vars to be Numeric
for (i in 3:8) {
    dat[,i] <- as.numeric(dat[,i])
}


# Plot 1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

hist(dat$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red")

dev.off()



# Plot 2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(x=dat$DateTime, y=dat$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
# Plot 3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(x=dat$DateTime, y=dat$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(x=dat$DateTime, y=dat$Sub_metering_2, col="red", type="l")
lines(x=dat$DateTime, y=dat$Sub_metering_3, col="blue", type="l")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

dev.off()
# Plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

par(mfrow=c(2,2))


# --Plot 1
plot(x=dat$DateTime, y=dat$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

# --Plot 2
plot(x=dat$DateTime, y=dat$Voltage, type="l",
     ylab="Voltage", xlab="")

# --Plot 3
plot(x=dat$DateTime, y=dat$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(x=dat$DateTime, y=dat$Sub_metering_2, col="red", type="l")
lines(x=dat$DateTime, y=dat$Sub_metering_3, col="blue", type="l")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
# --Plot 4
plot(x=dat$DateTime, y=dat$Global_reactive_power, type="l",
     ylab="Global Reactive Power", xlab="")

dev.off()
