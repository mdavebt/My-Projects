#  fips      SCC Pollutant Emissions  type year
#4  09001 10100401  PM25-PRI    15.714 POINT 1999
#8  09001 10100404  PM25-PRI   234.178 POINT 1999
#12 09001 10100501  PM25-PRI     0.128 POINT 1999
#16 09001 10200401  PM25-PRI     2.036 POINT 1999
#20 09001 10200504  PM25-PRI     0.388 POINT 1999
#24 09001 10200602  PM25-PRI     1.490 POINT 1999

	install.packages("reshape2")
	library(reshape2)

plot1 <- function(){
	NEI <- readRDS("summarySCC_PM25.rds")
	
SCC <- readRDS("Source_Classification_Code.rds")

	summary(as.numeric(NEI$Emissions))
	mean(is.na(NEI$Emissions))

	meltNEI <- melt(NEI, id.vars = "year", measure.vars = "Emissions",na.rm=TRUE,value.name="pm25")

	dcastNEI <- dcast(meltNEI, variable ~ year,mean,na.rm=TRUE,margins=c("year","variable"))

	dNEI <- dcastNEI[c(-1,-6)]
	dNEI

	avg_PM25_TONS <- NULL

	for(i in 1:length(names(dNEI))){
		avg_PM25_TONS <- c(avg_PM25_TONS,dNEI[1,i])
	}

	png(file = "plot1.png",width =480,height = 480,bg="white")
	plot(names(dNEI),avg_PM25_TONS,ylab = "Average PM2.5 (tons)",xlab = "Year", main = "Average Emission of PM25")

	z <- lm(avg_PM25_TONS~as.numeric(names(dNEI)))

	abline(z)
	dev.off()
}