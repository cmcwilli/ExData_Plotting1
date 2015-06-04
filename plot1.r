df  <- read.table("data/household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE)
subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
subdf$Global_active_power <- as.numeric(subdf$Global_active_power)

png("plot1.png", width=480, height=480)
hist(subdf$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
