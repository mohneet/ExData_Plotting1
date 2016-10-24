data<-read.table("household_power_consumption.txt",sep=';',header=TRUE,stringsAsFactors = FALSE)
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$Date <- strptime(data2$Date, "%d/%m/%Y")
data2$DateTime<-paste(data2$Date,data2$Time)
data2$Time<-as.POSIXlt(data2$DateTime)

hist(as.numeric(data2$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()







