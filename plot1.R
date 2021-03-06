# First, read in household energy usage data for Feb 1, 2007 and Feb 2, 2007. 
# Create Plot 1, a histogram of global active power, and save as png with a width of 480 pixels and a height of 480 pixels

setwd("~/Documents/Personal/Coursera/Data_Scientist_Toolbox/Exploratory Data Analysis/ExData_Plotting1")
hhPowerCons <- read.table("household_power_consumption.txt",header = FALSE,sep = ";",na.strings = "?",
                          colClasses = c(rep("character",2),rep("numeric",7)),nrows = 2880,skip=66637,
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                        "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hhPowerCons$Time <- strptime(paste(hhPowerCons$Date,hhPowerCons$Time,sep = ":"),format = "%d/%m/%Y:%H:%M:%S")
hhPowerCons <- hhPowerCons[,-1]
names(hhPowerCons)[1] <- "Date/Time"

png("plot1.png",width=480, height=480)
hist(hhPowerCons$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.off()
