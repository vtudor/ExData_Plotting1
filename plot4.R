## read household_power_consumption.txt 
input <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## get data for specific period
data <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]

GAP <- as.numeric(data$Global_active_power)
dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
sM1 <- as.numeric(data$Sub_metering_1)
sM2 <- as.numeric(data$Sub_metering_2)
sM3 <- as.numeric(data$Sub_metering_3)
volt <- as.numeric(data$Voltage)
GRP <- as.numeric(data$Global_reactive_power)

png("plot4.png", height=480,width=480)
size <- c(2, 2)
par(mfrow = size) 

plot(dt, GAP, type="l", xlab="", ylab="Global Active Power")
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dt, sM1, type="l", xlab="", ylab="Energy Submetering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
lines(dt, sM2, type="l", col="red")
lines(dt, sM3, type="l", col="blue")
plot(dt, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()