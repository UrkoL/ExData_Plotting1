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


# PLOT 3
# Change local settings
Sys.setlocale("LC_TIME", "C")
# Define y-axis limits
ymin <- 0
ymax <- 38
# Plot sub_metering_1
plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.7,ylim=c(ymin,ymax))
# Not to clean the frame before drawing
par(new=TRUE)
# Plot sub_metering_2
plot(data$Date_Time,data$Sub_metering_2,type="l",col="red",xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.7,ylim=c(ymin,ymax))
# Not to clean the frame before drawing
par(new=TRUE)
# Plot sub_metering_3
plot(data$Date_Time,data$Sub_metering_3,type="l",col="blue",xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.7,ylim=c(ymin,ymax))
# Introduce the legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),cex=0.7)
# Save figure
dev.copy(png,file="plot3.png")
# Close graphics device
dev.off()