Plot1<-function(file){
tb<-read.table(file, sep=";", header=T)
tb$Date<-as.Date(tb$Date, format="%d/%m/%Y")
tb<-subset(tb, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
print(class(tb$Global_active_power))
tb$Global_active_power<-as.numeric(as.character(tb$Global_active_power))
png("Plot1.png")
hist(tb$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.off()
}