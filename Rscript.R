# Read the data from the file
x <- read.table("household_power_consumption.txt", header=TRUE, sep = ';' , stringsAsFactors = FALSE)

x$Date <-  as.Date(x$Date , "%d/%m/%Y")
# Create subset
xsub<-subset(x , Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Convert Global active power column to number for plotting
xsub$Global_active_power <- as.numeric(xsub$Global_active_power)

# Start creating png
png(filename="ExData_Plotting1/plto1.png" , width = 480 , height = 480)
hist(xsub$Global_active_power ,col="red" , main = "global active power" , xlab = "Global Active Power (kilowatts)")
dev.off()

xsub["date_time"] <- paste(xsub$Date,xsub$Time)
xsub$date_time <- as.POSIXct(xsub$date_time)
png(filename="ExData_Plotting1/plto2.png" , width = 480 , height = 480)
plot(xsub$date_time,xsub$Global_active_power , type = "l" , ylab ="Global Active Power")
dev.off()

png(filename="ExData_Plotting1/plto3.png" , width = 480 , height = 480)
plot(xsub$date_time,xsub$Sub_metering_1 , type = "l" , ylab ="Global Active Power")
lines(xsub$date_time,xsub$Sub_metering_2 , col="red")
lines(xsub$date_time,xsub$Sub_metering_3 , col="blue")
legend("topright" ,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1, col=c('black', 'red', 'blue') ,cex=0.85, pch=1, pt.cex = 0 ,lwd=c(2.5,2.5)  , bty = "n")
dev.off()

png(filename="ExData_Plotting1/plto4.png" , width = 480 , height = 480)
par(mar=c(2,6,2,2), mfrow=c(2,2))
plot(xsub$date_time,xsub$Global_active_power , type = "l" , ylab ="Global Active Power")
plot(xsub$date_time,xsub$Voltage , type = "l" , ylab ="Voltage" , xlab= "datetime")
plot(xsub$date_time,xsub$Sub_metering_1 , type = "l" , ylab ="Global Active Power")
lines(xsub$date_time,xsub$Sub_metering_2 , col="red")
lines(xsub$date_time,xsub$Sub_metering_3 , col="blue")
plot(xsub$date_time,xsub$Global_reactive_power , type = "l" , ylab ="Global Reactive Power")
dev.off()