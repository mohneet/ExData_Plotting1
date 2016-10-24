data<-read.table("household_power_consumption.txt",sep=';',header=TRUE,stringsAsFactors = FALSE)
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
data2$Date <- strptime(data2$Date, "%d/%m/%Y")
data2$DateTime<-paste(data2$Date,data2$Time)
data2$Time<-as.POSIXlt(data2$DateTime)


png(file="plot4.png")
par(mfrow=c(2,2))

with(data2,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(data2,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
plot(data2$Time,data2$Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering")
points(data2$Time,data2$Sub_metering_2,col="red",type="l")
points(data2$Time,data2$Sub_metering_3,col="blue",type="l")
legend("topright",bty="n",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data2,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()