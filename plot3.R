## Plot 3- Energy Sub-metering
#Reading data
pdata = read.table(file = "household_power_consumption.txt", nrows = 1000000,
                  sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Handling Date
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")

#Subsetting 1 and 2 February
pdata2 <-subset(pdata, pdata$Date == "2007-02-01" | pdata$Date =="2007-02-02")
pdata2$DateTime <- as.POSIXct(paste(pdata2$Date, pdata2$Time), 
                              "%d/%m/%Y %H:%M:%S")

## Plotting Energy Sub-metering
par(mar = c(2,5,3,2))
with(pdata2, plot(DateTime,Sub_metering_1, type = "n", ylab = 
                      "Energy sub metering"))
with(pdata2, {
    lines(pdata2$DateTime, Sub_metering_1, col = "black")
    lines(pdata2$DateTime, Sub_metering_2, col = "red")
    lines(pdata2$DateTime, Sub_metering_3, col = "blue")
})
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), 
        col = c("black", "red", "blue"), pch = "___", cex = 0.8, 
                                    text.width = strwidth("Sub_metering_2"))

##Copy to file device = png
dev.copy(png, file = "plot3.png")
dev.off()
