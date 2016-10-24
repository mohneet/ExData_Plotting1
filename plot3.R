data<-read.table("household_power_consumption.txt",sep=';',header=TRUE,stringsAsFactors = FALSE)
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$Date <- strptime(data2$Date, "%d/%m/%Y")
data2$DateTime<-paste(data2$Date,data2$Time)
data2$Time<-as.POSIXlt(data2$DateTime)

png(file="plot3.png")
plot(data2$Time,data2$Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering")
points(data2$Time,data2$Sub_metering_2,col="red",type="l")
points(data2$Time,data2$Sub_metering_3,col="blue",type="l")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()