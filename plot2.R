## Plot 2- Global Active Power Daywise

#Reading data
pdata = read.table(file = "household_power_consumption.txt", nrows = 1000000,
                   sep = ";", header = T, na.strings = "?", stringsAsFactors = F)
## Handling Date
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")

#Subsetting 1 and 2 February
pdata2 <-subset(pdata, pdata$Date == "2007-02-01" | pdata$Date =="2007-02-02")
pdata2$DateTime <- as.POSIXct(paste(pdata2$Date, pdata2$Time), 
                              "%d/%m/%Y %H:%M:%S")

## Plotting Global Active Power
par(mar = c(2,4,1,1))
with(pdata2, plot(DateTime,Global_active_power, type = "n", ylab = 
    "Global Active Power (kilowatts)"))
with(pdata2, lines(DateTime, Global_active_power))

##Copy to file device = png
dev.copy(png, file = "plot2.png")
dev.off()
