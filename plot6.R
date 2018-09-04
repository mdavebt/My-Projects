#  fips      SCC Pollutant Emissions  type year
#4  09001 10100401  PM25-PRI    15.714 POINT 1999
#8  09001 10100404  PM25-PRI   234.178 POINT 1999
#12 09001 10100501  PM25-PRI     0.128 POINT 1999
#16 09001 10200401  PM25-PRI     2.036 POINT 1999
#20 09001 10200504  PM25-PRI     0.388 POINT 1999
#24 09001 10200602  PM25-PRI     1.490 POINT 1999

	install.packages("reshape2")
	library(reshape2)
	install.packages("stringr")
	library(stringr)
	install.packages("ggplot2")
	library(ggplot2)

plot6 <- function(){
	NEI <- readRDS("summarySCC_PM25.rds")
	
SCC <- readRDS("Source_Classification_Code.rds")

	a <- grep("Vehicles",SCC$EI.Sector)

	motorSCC <- SCC$SCC[a]

	d <- NULL

	for(i in 1:length(motorSCC)){
		b <- which(as.character(motorSCC[i]) == as.character(NEI$SCC))
		d <- c(d,b)
	}
	
	motorNEI <- NEI[d,]

	motorNEIBandC <- subset(motorNEI,motorNEI$fips == "24510" | motorNEI$fips == "06037")

	for(j in 1:length(motorNEIBandC$fips)){

		if (as.character(motorNEIBandC$fips[j]) == "24510"){
			motorNEIBandC$fips[j] <- "Baltimore"
		}else {motorNEIBandC$fips[j] <- "Los.Angeles"}
	}

	#motorNEIBandC$year <- factor(motorNEIBandC$year,labels=c("1999","2002","2005","2008"))
	
	png(file = "plot6.png",width =1020,height = 480,bg="white")
	g <- ggplot(motorNEIBandC,aes(x=year,y=Emissions)) + geom_point() + scale_y_continuous(name = "Motor Vehicle Emissions (Tons)")+facet_grid(.~fips)+geom_smooth(method = "lm")+coord_cartesian(ylim=c(0,600))
	print(g)
	dev.off()
}