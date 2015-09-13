

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