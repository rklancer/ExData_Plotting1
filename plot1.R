# Read the data.
source("readData.R")
df <- readData()

png("plot1.png", width=480, height=480, bg="white")

hist(df$Global_active_power,
    col="red",
    border="black",
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    # just clarifying the default:
    breaks=nclass.Sturges
)

dev.off()
