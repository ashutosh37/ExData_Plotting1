# Read the data from the file
x <- read.table("household_power_consumption.txt", header=TRUE, sep = ';' , stringsAsFactors = FALSE)

x$Date <-  as.Date(x$Date , "%d/%m/%Y")
# Create subset
xsub<-subset(x , Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Convert Global active power column to number for plotting
xsub$Global_active_power <- as.numeric(xsub$Global_active_power)

###  Plot 1  ########
# Start creating pnglibrary(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)
png(filename="ExData_Plotting1/plto1.png" , width = 480 , height = 480)
hist(xsub$Global_active_power ,col="red" , main = "global active power" , xlab = "Global Active Power (kilowatts)")
dev.off()


###  Plot 2  ########
xsub["date_time"] <- paste(xsub$Date,xsub$Time)
xsub$date_time <- as.POSIXct(xsub$date_time)
png(filename="ExData_Plotting1/plto2.png" , width = 480 , height = 480)
plot(xsub$date_time,xsub$Global_active_power , type = "l" , ylab ="Global Active Power (Kilowatts)" , xlab="datetime")
dev.off()

###  Plot 3  ########
png(filename="ExData_Plotting1/plto3.png" , width = 480 , height = 480)
plot(xsub$date_time,xsub$Sub_metering_1 , type = "l" , ylab ="Global Active Power" ,xlab="datetime")
lines(xsub$date_time,xsub$Sub_metering_2 , col="red")
lines(xsub$date_time,xsub$Sub_metering_3 , col="blue")
legend("topright" ,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1, col=c('black', 'red', 'blue') ,cex=0.85, pch=1, pt.cex = 0 ,lwd=c(2.5,2.5)  , bty = "n")
dev.off()


###  Plot 4  ########
png(filename="ExData_Plotting1/plto4.png" , width = 480 , height = 480)
par(mfrow=c(2,2))
plot(xsub$date_time,xsub$Global_active_power , type = "l" , ylab ="Global Active Power",, xlab= "datetime")
plot(xsub$date_time,xsub$Voltage , type = "l" , ylab ="Voltage" , xlab= "datetime")
plot(xsub$date_time,xsub$Sub_metering_1 , type = "l" , ylab ="Global Active Power"  , xlab="datetime")
lines(xsub$date_time,xsub$Sub_metering_2 , col="red")
lines(xsub$date_time,xsub$Sub_metering_3 , col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
plot(xsub$date_time,xsub$Global_reactive_power , type = "l" , ylab ="Global Reactive Power",xlab="datetime")
dev.off()