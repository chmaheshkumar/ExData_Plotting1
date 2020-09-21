data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
join_date <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png",
    width  = 480,
    height = 480)
plot(join_date,  sub_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(join_date, sub_data$Sub_metering_2, type="l", col="red")
lines(join_date, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))
dev.off()

