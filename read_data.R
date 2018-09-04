 #readLines("household_power_consumption.txt",3)
"Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_#1;Sub_metering_2;Sub_metering_3"
#"16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000"                        #"16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000"                        

readdata <- function(){
	data_power <- read.table("household_power_consumption.txt",header= TRUE,sep=";")
	
	dates <- as.character(data_power$Date)
	times <- as.character(data_power$Time)

	date_time <- paste(dates,times)

	actual_date <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

	data_power_subset <- subset(data_power,  as.Date(actual_date) == as.Date("01/02/2007","%d/%m/%Y") | as.Date(actual_date) == as.Date("02/02/2007","%d/%m/%Y"))

	data_power_subset
}