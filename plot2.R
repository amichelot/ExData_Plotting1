#Coursera - Exploratory Data Analysis
#Course project - Week 1

#Load the data
raw <- read.csv2("M:/Coursera/R/Data/household_power_consumption.txt", na.string="?", dec=".", colClasses=c(rep("character", 2), rep("numeric", 7)))

#Prepare the dataset
subset <- subset(raw, Date %in% c("1/2/2007", "2/2/2007"))
data <- data.frame(Date=as.Date(subset[["Date"]], format="%d/%m/%Y"), Time=strptime(paste(subset[["Date"]], subset[["Time"]]), format="%d/%m/%Y %T"), subset[3:9])

#Set the language for the dates
Sys.setlocale("LC_TIME", "C")

#Plot the graphic
png("M:/GitHub/ExData_Plotting1/plot2.png", bg="transparent")
plot(data$Time, data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()