# Read the data in. The script should be run from the directory where the data file was extracted
data_all=read.table("./household_power_consumption.txt", sep=";", comment.char="", header=T, stringsAsFactors=F)
# subset only required dates - 01/02/2007 and 02/02/2007 
data_pr1=data_all[data_all$Date %in% c("1/2/2007", "2/2/2007"),]
# free up mempry by removing the lare data frame which is no longer needed
rm(data_all)
# Open PNG device
png(file="./plot1.png")
# cerate a histogram and write it to the PNG file
hist(as.numeric(data_pr1$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
# close PNG device
dev.off()