# Returns a data.frame containing data from data/houshold_power_consumption.txt
# modified as follows:
#  1. containing only data from 2/1/2007 and 2/2/2007
#  2. with the separate "Date" and "Time" columns consolidated into a single
#     "datetime" column of the POSIXlt class (with no timezone)
#
# NOTE: In order to load data efficiently (thus allowing easy iteration on the
# plotting code), this caches the filtered data in the file
# data/household_power_consumption_filtered.txt. If that file exists, this
# function will always use the data from the that file.
#

# (This borrows a technique from common Javascript practice to avoid putting
# the private helper writeSubset into global scope:)
readData <- (function() {

    # selects lines from data/household_power_consumption.txt that start with
    # "1/2/2007" or "2/2/2007", writes them to
    # data/household_power_consumption_filtered.txt with the header row from
    # the source file prepended.
    writeSubset <- function() {
        l <- readLines('data/household_power_consumption.txt')
        # c(1, ...): remember to write header row
        writeLines(l[c(1, grep("^[1-2]\\/2\\/2007", l))],
            'data/household_power_consumption_filtered.txt',
        )
    }

    # The actual readData function:
    function() {
        if (!file.exists('data/household_power_consumption_filtered.txt')) {
            writeSubset()
        }

        # we'll just do this the most naive (and slow) way
        df <- read.delim('data/household_power_consumption_filtered.txt',
            header=TRUE,
            sep=';',
            colClasses=c("character", "character", "numeric", "numeric",
                         "numeric",   "numeric",   "numeric", "numeric",
                         "numeric")
        )
        # replace separate date and time columns w/a POSIXlt datetime column
        df$datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
        df$Date = NULL
        df$Time = NULL
        df
    }
})()
