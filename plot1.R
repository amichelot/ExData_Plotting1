#Coursera - Exploratory Data Analysis
#Course project - Week 1

#Load the data
raw <- read.csv2("M:/Coursera/R/Data/household_power_consumption.txt", na.string="?", dec=".", colClasses=c(rep("character", 2), rep("numeric", 7)))

#Prepare the dataset
subset <- subset(raw, Date %in% c("1/2/2007", "2/2/2007"))
data <- data.frame(Date=as.Date(subset[["Date"]], format="%d/%m/%Y"), Time=strptime(paste(subset[["Date"]], subset[["Time"]]), format="%d/%m/%Y %T"), subset[3:9])

#Plot the histogram
png("M:/GitHub/ExData_Plotting1/plot1.png", bg="transparent")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()