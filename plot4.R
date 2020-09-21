data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
join_date <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2)) 

plot(join_date, sub_data$Global_active_power, 
     type="l", 
     xlab="", ylab="Global Active Power", 
     cex=0.2)

plot(join_date, sub_data$Voltage, type="l", xlab="", ylab="Voltage")

plot(join_date,  sub_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(join_date, sub_data$Sub_metering_2, type="l", col="red")
lines(join_date, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))

plot(join_date, sub_data$Global_reactive_power, 
     type="l", xlab="", ylab="Global_reactive_power", 
     cex=0.2)

dev.off()