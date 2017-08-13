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
  
#Mutate the subset to add a new Date and Time column to use as the x-axis in the line chart
HHPowerConsumeSubset <- mutate (HHPowerConsumeSubset, Datetime = as.POSIXct(paste(HHPowerConsumeSubset$Date, HHPowerConsumeSubset$Time)) )

#Plot the line chart
with(HHPowerConsumeSubset, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")})

#Create a png export of the line chart
dev.copy(png,'plot2.png', height=480, width=480)
dev.off()

  
  