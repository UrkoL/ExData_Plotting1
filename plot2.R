# Download zip file
download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
# Unzip file
unzip(zipfile="data.zip")
# How much memory do I need? (in MB)
memo <- 2075259*9*8/2^20
# Load data
completedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Convert first to columns to data class
completedata[,1] <- as.Date(completedata[,1],format="%d/%m/%Y")
# Find dates from 2007-02-01 to 2007-02-02
tf <- completedata[,1]>="2007-02-01" & completedata[,1]<="2007-02-02"
# Take a subset of data
data <- completedata[tf,]
# Paste date and time
data[,1] <- paste(data[,1],data[,2])
# Erase column
data$Time <- NULL
# Change column name
names(data)[1] <- "Date_Time"
# Convert column to date/time format
data$Date_Time <- strptime(data$Date_Time,format="%Y-%m-%d %H:%M:%S")


## PLOT 2
# Change local settings
Sys.setlocale("LC_TIME", "C")
# Create plot
plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",cex.axis=0.7,cex.lab=0.7)
# Save figure
dev.copy(png,file="plot2.png")
# Close graphics device
dev.off()