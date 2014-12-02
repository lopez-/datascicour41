setwd("C:/Users/Victor/Desktop/Project 1")

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")

library(dplyr)

data <- read.csv2("household_power_consumption.txt",colClasses="character")
data <- tbl_df(data)

for (i in 3:9) {
        data[,i] <- as.numeric(data[,i])
}

sub <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

sub$Date <- as.Date(sub$Date,format="%d/%m/%Y")

sub$Datetime=paste(sub$Date,sub$Time,sep=" ")

sub$Datetime <- strptime(sub$Datetime,format="%Y-%m-%d %H:%M:%S")

# plot 4
png("plot4.PNG",width=480,height=480)
par(mfrow=c(2,2),mar=c(2,4,1,1))

plot(sub$Datetime,sub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(sub$Datetime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(sub$Datetime,sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black",lty=1)
lines(sub$Datetime,sub$Sub_metering_2,type="l",col="red",lty=1)
lines(sub$Datetime,sub$Sub_metering_3,type="l",col="blue",lty=1)
legend("topright",bty="n",names(sub[,7:9]),col=c("black","red","blue"),lty=c(1,1,1))

plot(sub$Datetime,sub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="")

dev.off()