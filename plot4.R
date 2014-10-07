# First, read in household energy usage data for Feb 1, 2007 and Feb 2, 2007. 
# Create Plot 4, 4 graphs in a 2x2 array, one of global active power, one of voltage, one of energy sub metering
# and one of global reactive power per day, and save as png with a width of 480 pixels and a 
#  height of 480 pixels

setwd("~/Documents/Personal/Coursera/Data_Scientist_Toolbox/Exploratory Data Analysis/ExData_Plotting1")
hhPowerCons <- read.table("household_power_consumption.txt",header = FALSE,sep = ";",na.strings = "?",
                          colClasses = c(rep("character",2),rep("numeric",7)),nrows = 2880,skip=66637,
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                        "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hhPowerCons$Time <- strptime(paste(hhPowerCons$Date,hhPowerCons$Time,sep = ":"),format = "%d/%m/%Y:%H:%M:%S")
hhPowerCons <- hhPowerCons[,-1]
names(hhPowerCons)[1] <- "Date/Time"

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(hhPowerCons[,1],hhPowerCons$Global_active_power,xlab="",ylab = "Global Active Power",type="l")
plot(hhPowerCons[,1],hhPowerCons$Voltage,xlab="datetime",ylab = "Voltage",type="l")
plot(hhPowerCons[,1],hhPowerCons$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(hhPowerCons[,1],hhPowerCons$Sub_metering_2,type = "l",col = "red")
lines(hhPowerCons[,1],hhPowerCons$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = names(hhPowerCons)[6:8],col = c("black","red","blue"),lty = 1,bty = "n")
plot(hhPowerCons[,1],hhPowerCons$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
