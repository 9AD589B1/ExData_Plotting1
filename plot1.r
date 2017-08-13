#Remove all variables
rm(list=ls(all=TRUE))

#Install and load required libraries for data preparation and visualization
install.packages("dplyr")
library(dplyr)

#Get and set working directory
setwd(getwd())

#Load the data set
HHPowerConsume = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the "Date" variable to a date type, filter the date range to 2007-02-01 - 2007-02-02, and store the subset to HHPowerConsumeSubset
HHPowerConsumeSubset <-
HHPowerConsume %>%
mutate( Date = as.Date(Date, format = "%d/%m/%Y")) %>%
filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot a histogram with the desired formatting
hist(HHPowerConsumeSubset$Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col = "Red")

#Create a png export of the histogram
dev.copy(png,'plot1.png', height=480, width=480)
dev.off()