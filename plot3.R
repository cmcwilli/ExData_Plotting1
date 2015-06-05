##Plot 3

##Import Data and Subset
df  <- read.table("data/household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE)
subdf <- df[df$Date %in% c("2/1/2007","2/2/2007") ,]

##Clean up the classes
subdf$Date <- as.Date(subdf$Date, format ="%d/%m/%Y")
subdf$Sub_metering_1 <- as.numeric(subdf$Sub_metering_1)
subdf$Sub_metering_2 <- as.numeric(subdf$Sub_metering_2)
subdf$Sub_metering_3 <- as.numeric(subdf$Sub_metering_3)


subdf$Date <- as.Date(subdf$Date, format ="%d/%m/%Y")
subdf <- cbind(subdf,paste(subdf$Date,subdf$Time),stringsAsFactors=FALSE)
colnames(subdf)[10] <- "datetime"
subdf$datetime <- strptime(subdf$datetime, format = "%Y-%d-%m %H:%M:%S")

with(subdf, plot(datetime,subdf,Sub_metering_1, type="n" , ylab="Energy sub metering"))
with(subdf, lines(datetime, Sub_metering_1, col="black"))
with(subdf, lines(datetime, Sub_metering_2, col = "red"))
with(subdf, lines(datetime, Sub_metering_3, col = "blue"))


png("plot3.png", width=480, height=480)

dev.off()
