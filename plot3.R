plot3 <- function() {
  library(sqldf)
  datesubset <- read.csv.sql(file = "household_power_consumption.txt",
      "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
  closeAllConnections()
  datetime <- paste(datesubset$Date, datesubset$Time, sep = " ")
  Date <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  datesubset2 <- cbind(Date, datesubset[,3:9])
  png("plot3.png", width = 480, height = 480, units = "px")
  with(datesubset2, plot(Date, Sub_metering_1, type = "l",
      ylab = "Energy sub metering"))
  lines(datesubset2$Date, datesubset2$Sub_metering_2, col = "red")
  lines(datesubset2$Date, datesubset2$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty = c(1, 1, 1), col = c("black", "red", "blue"))
  dev.off()
}