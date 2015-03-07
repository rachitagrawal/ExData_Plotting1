Plot2<-function(file){
tb<-read.table(file, sep=";", header=T)
tb$Date<-as.Date(tb$Date, format="%d/%m/%Y")
tb<-subset(tb, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
png("Plot2.png")
plot(as.POSIXct(paste(tb$Date, tb$Time)), tb$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
}