# Read the data.
source("readData.R")
df <- readData()

png("plot2.png", width=480, height=480, bg="white")

plot(df$datetime, df$Global_active_power, type="l",
        col="black",
        xlab="",
        ylab = "Global Active Power (kilowatts)"
)

dev.off()
