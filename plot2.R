data_full_set <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full_set$Date <- as.Date(data_full_set$Date, format="%d/%m/%Y")


data<- subset(data_full_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full_set)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()