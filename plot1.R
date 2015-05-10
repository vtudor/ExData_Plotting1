## read household_power_consumption.txt 
input <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## get data for specific period
data <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]

GAC <- as.numeric(data$Global_active_power)

png("plot1.png", height=480, width=480)
text("vtudor")
hist(GAC, col="orange", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()