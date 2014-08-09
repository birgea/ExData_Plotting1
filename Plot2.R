# Read the data in. The script should be run from the directory where the data file was extracted
data_all=read.table("./household_power_consumption.txt", sep=";", comment.char="", header=T, stringsAsFactors=F)
# subset only required dates - 01/02/2007 and 02/02/2007
data_pr1=data_all[data_all$Date %in% c("1/2/2007", "2/2/2007"),]
# free up mempry by removing the lare data frame which is no longer needed
rm(data_all)
# Create a new column that will containg the Date-Time string
data_pr1$Date_Time=paste(data_pr1$Date, data_pr1$Time)
# Convert the Date-Time character string into the Date class
data_pr1$Date_Time=strptime(data_pr1$Date_Time, "%d/%m/%Y %H:%M:%S")
# open PNG device
png(file="./plot2.png")
# create a chart of the active power consumption throughout two days time frame and save it to the png file
with(data_pr1, plot(Date_Time, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))
#close PNG device
dev.off()