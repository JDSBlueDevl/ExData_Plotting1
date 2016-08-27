plot4 <- function() {
  library(sqldf)
  datesubset <- read.csv.sql(file = "household_power_consumption.txt",
                             "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
  closeAllConnections()
  datetime <- paste(datesubset$Date, datesubset$Time, sep = " ")
  Date <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  datesubset2 <- cbind(Date, datesubset[,3:9])
  png("plot4.png", width = 480, height = 480, units = "px")
  par(mfcol = c(2, 2))
  with(datesubset2, plot(Date, Global_active_power, type = "l", 
    xlab = "", ylab = "Global Active Power (kilowatts)"))
  with(datesubset2, plot(Date, Sub_metering_1, type = "l", xlab = "",
    ylab = "Energy sub metering"))
  lines(datesubset2$Date, datesubset2$Sub_metering_2, col = "red")
  lines(datesubset2$Date, datesubset2$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = c(1, 1, 1), col = c("black", "red", "blue"))
  with(datesubset2, plot(Date, Voltage, type = "l", xlab = "datetime"))
  with(datesubset2, plot(Date, Global_reactive_power, type = "l", xlab = "datetime"))
  dev.off()
}
