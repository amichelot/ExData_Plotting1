#Coursera - Exploratory Data Analysis
#Course project - Week 1

#Load the data
raw <- read.csv2("M:/Coursera/R/Data/household_power_consumption.txt", na.string="?", dec=".", colClasses=c(rep("character", 2), rep("numeric", 7)))

#Prepare the dataset
subset <- subset(raw, Date %in% c("1/2/2007", "2/2/2007"))
data <- data.frame(Date=as.Date(subset[["Date"]], format="%d/%m/%Y"), Time=strptime(paste(subset[["Date"]], subset[["Time"]]), format="%d/%m/%Y %T"), subset[3:9])

#Set the language for the dates
Sys.setlocale("LC_TIME", "C")

#Plot the graphics
png("M:/GitHub/ExData_Plotting1/plot3.png", bg="transparent")
with(data, {
  plot(Time, Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
})
legend("topright", lty=rep(1, 3), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()