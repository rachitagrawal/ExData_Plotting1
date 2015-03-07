Plot4<-function(file){
tb<-read.table(file, sep=";", header=T)
tb$Date<-as.Date(tb$Date, format="%d/%m/%Y")
tb<-subset(tb, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
tb$Global_reactive_power<-as.numeric(as.character(tb$Global_reactive_power))
tb$Voltage<-as.numeric(as.character(tb$Voltage))
png("Plot4.png")
par(mfrow=c(2,2))
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_2, col="red")
lines(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       lty=1, bty="n", col=c("black", "red", "blue"))
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
}