Plot3<-function(file){
tb<-read.table(file, sep=";", header=T)
tb$Date<-as.Date(tb$Date, format="%d/%m/%Y")
tb<-subset(tb, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
png("Plot3.png")
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_2, col="red")
lines(as.POSIXct(paste(tb$Date, tb$Time)), tb$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
dev.off()
}