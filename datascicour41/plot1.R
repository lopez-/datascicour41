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

# plot 1
png("plot1.PNG",width=480,height=480)
hist(sub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()