## Plot 1- Global Active Power

#Reading data
pdata = read.table(file = "household_power_consumption.txt", nrows = 1000000,
                  sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Handling Date
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")

# Verifying reading of NAs
table(is.na(pdata$Voltage))

#Subsetting 1 and 2 February
pdata2 <-subset(pdata, pdata$Date == "2007-02-01" | pdata$Date =="2007-02-02")

## Plotting Global Active Power
par(mar = c(4,6,3,4))
with(pdata2, hist(Global_active_power, col = "red", main = "Global Active
                  Power", xlab = "Global Active Power (kilowatts)"))

##Copy to file device = png
dev.copy(png, file = "plot1.png")
dev.off()
