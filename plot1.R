plot1 <- function() {
  library(sqldf)
  datesubset <- read.csv.sql(file = "household_power_consumption.txt",
      "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
  closeAllConnections()
  png("plot1.png", width = 480, height = 480, units = "px")
  hist(datesubset$Global_active_power, main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", col = "red")
  dev.off()
}