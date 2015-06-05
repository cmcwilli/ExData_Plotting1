##Plot 2
df  <- read.table("data/household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE)

subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

subdf$Global_active_power <- as.numeric(subdf$Global_active_power)

subdf$Date <- as.Date(subdf$Date, format ="%d/%m/%Y")
subdf <- cbind(subdf,paste(subdf$Date,subdf$Time),stringsAsFactors=FALSE)
colnames(subdf)[10] <- "datetime"
subdf$datetime <- strptime(subdf$datetime, format = "%d/%m/%Y %H:%M:%S")

plot(subdf$Date, subdf$Global_active_power,type="l")
