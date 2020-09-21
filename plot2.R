data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
join_date <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png",width  = 480,height = 480)
plot(join_date,sub_data$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

