## Plot 4- 4 Plots
#Reading data
pdata = read.table(file = "household_power_consumption.txt", nrows = 1000000,
                   sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Handling Date
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")

#Subsetting 1 and 2 February
pdata2 <-subset(pdata, pdata$Date == "2007-02-01" | pdata$Date =="2007-02-02")
pdata2$DateTime <- as.POSIXct(paste(pdata2$Date, pdata2$Time), 
                              "%d/%m/%Y %H:%M:%S")

## Plotting the 4 plots
par(mfrow = c(2,2), mar = c(5,5,2,1))
##Plot 1
with(pdata2, plot(DateTime,Global_active_power, type = "n", ylab = 
                      "Global Active Power", xlab = ""))
with(pdata2, lines(DateTime, Global_active_power))

##Plot 2
with(pdata2, plot(DateTime, Voltage, type = "n", ylab ="Voltage", 
                  xlab = "datetime"))
with(pdata2, lines(DateTime, Voltage))

##Plot 3
with(pdata2, plot(DateTime,Sub_metering_1, type = "n", ylab = 
                      "Energy sub metering", xlab = ""))
with(pdata2, {
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
})
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       pch = "___", bty = "n", cex = 0.7, text.width = strwidth("Sub_metering_3"))

##Plot 4
with(pdata2, plot(DateTime, Global_reactive_power, type = "n", 
                  ylab = "Global_reactive_power", xlab = "datetime"))
with(pdata2, lines(DateTime, Global_reactive_power))

##Copy to file device = png
dev.copy(png, file = "plot4.png")
dev.off()
