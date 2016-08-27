plot2 <- function() {
  library(sqldf)
  datesubset <- read.csv.sql(file = "household_power_consumption.txt",
      "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
  closeAllConnections()
  datetime <- paste(datesubset$Date, datesubset$Time, sep = " ")
  Date <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  datesubset2 <- cbind(Date, datesubset[,3:9])
  png("plot2.png", width = 480, height = 480, units = "px")
  with(datesubset2, plot(Date, Global_active_power, type = "l", 
      xlab = "", ylab = "Global Active Power (kilowatts)"))
  dev.off()
}
